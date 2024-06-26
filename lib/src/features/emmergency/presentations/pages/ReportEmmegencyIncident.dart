import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:i_gatchu/src/features/auth/data/providers/auth_provider.dart';
import 'package:i_gatchu/src/features/emmergency/data/providers/emergency_alertprovider.dart';
import 'package:i_gatchu/src/features/emmergency/data/providers/support_service_provider.dart';
import 'package:i_gatchu/src/features/emmergency/presentations/widgets/LocationPicker.dart';

import '../../../../shared/input/Button.dart';
import '../../../../shared/styles/input_styles.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/helpers.dart';

class ReportEmergencyIncident extends HookConsumerWidget {
  const ReportEmergencyIncident({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormBuilderState>());
    final images = useState<List<String>>([]);
    final loading = useState<bool>(false);
    final theme = Theme.of(context);

    final serviceAsync = ref.watch(supportServiceProvider);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.chevron_left),
        ),
        title: const Text("Report emergency incident"),
      ),
      body: SingleChildScrollView(
        child: serviceAsync.when(
            data: (service) => SafeArea(
                    child: FormBuilder(
                  key: formKey,
                  child: Container(
                    padding: const EdgeInsets.all(Constants.SPACING * 2),
                    decoration: BoxDecoration(
                      // color: color,
                      borderRadius: BorderRadius.circular(Constants.ROUNDNESS),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: Constants.SPACING),
                          DecoratedBox(
                            decoration: const BoxDecoration(),
                            child: SvgPicture.asset(
                              "assets/images/event.svg",
                              semanticsLabel: "Event",
                              fit: BoxFit.contain,
                              height: 150,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Report Emergency",
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: Constants.SPACING),
                          FormBuilderDropdown(
                            name: "supportServiceId",
                            decoration: inputDecoration(
                              prefixIcon: Icons.warning,
                              placeholder: "Select emergency",
                              label: "Emergency",
                            ),
                            items: service
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e.id,
                                    child: Text(e.name),
                                  ),
                                )
                                .toList(),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                            ]),
                          ),
                          const SizedBox(height: Constants.SPACING),
                          FormBuilderTextField(
                            name: "title",
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                            ]),
                            decoration: inputDecoration(
                              prefixIcon: Icons.label_important_outlined,
                              label: "Title",
                              placeholder: "Enter event title",
                            ),
                          ),
                          const SizedBox(height: Constants.SPACING),
                          FormBuilderTextField(
                            validator: FormBuilderValidators.compose([
                            ]),
                            name: "description",
                            decoration: inputDecoration(
                              prefixIcon: Icons.info,
                              label: "Description",
                              placeholder: "Describe event",
                            ),
                          ),
                          const SizedBox(height: Constants.SPACING),
                          FormBuilderField<Map<String, dynamic>>(
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                  errorText: "Required"),
                            ]),
                            builder: (state) {
                              final controller = TextEditingController(
                                  text: state.value?["address"]);
                              return TextField(
                                controller: controller,
                                readOnly: true,
                                decoration: inputDecoration(
                                  placeholder: "Search location ...",
                                  prefixIcon: Icons.map,
                                  label: "Your location",
                                ).copyWith(errorText: state.errorText),
                                onTap: () {
                                  showModalBottomSheet(
                                      isScrollControlled: true,
                                      context: context,
                                      isDismissible: true,
                                      showDragHandle: true,
                                      useSafeArea: true,
                                      builder: (context) {
                                        return LocationPicker(
                                          onChange: (place) {
                                            // controller.text = place.display;
                                            state.didChange({
                                              "lat": place.coordinates.lat,
                                              "lng": place.coordinates.lng,
                                              "address": place.display
                                            });
                                          },
                                        );
                                      });
                                },
                              );
                            },
                            name: "location",
                          ),
                          const SizedBox(height: Constants.SPACING),
                          FormBuilderImagePicker(
                            name: 'images',
                            decoration: inputDecoration(
                              prefixIcon: Icons.image,
                              label: "Images",
                              placeholder: "Pick images",
                            ),
                            maxImages: 5,
                          ),
                          const SizedBox(height: Constants.SPACING),
                          Consumer(
                            builder: (context, ref, child) {
                              return Button(
                                title: "Submit",
                                disabled: loading.value,
                                loading: loading.value,
                                onPress: () {
                                  if (formKey.currentState!.saveAndValidate()) {
                                    // If the form is valid, display a snack-bar. In the real world,
                                    // you'd often call a server or save the information in a database.
                                    loading.value = true;
                                    ref
                                        .read(emergencyAlertProvider.notifier)
                                        .addEmergencyAlert(
                                            formKey.currentState!.value)
                                        .then((value) {
                                      context.pop();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Emergency added successfully!')),
                                      );
                                    }).catchError((error) {
                                      handleResponseError(
                                          context,
                                          formKey.currentState!.fields,
                                          error,
                                          ref
                                              .read(authStateProvider.notifier)
                                              .logout);
                                    }).whenComplete(
                                      () => loading.value = false,
                                    );
                                  }
                                },
                              );
                            },
                          ),
                          const SizedBox(
                            height: Constants.SPACING,
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
            error: (error, _) => Center(child: Text(error.toString())),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                )),
      ),
    );
  }
}
