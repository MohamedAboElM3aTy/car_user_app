import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class AddCarForm extends StatefulWidget {
  const AddCarForm({
    super.key,
    this.carModel,
  });

  final CarModel? carModel;

  @override
  State<AddCarForm> createState() => _AddCarFormState();
}

class _AddCarFormState extends State<AddCarForm> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _modelNameController,
      _colorController,
      _speedController,
      _priceController,
      _descriptionController,
      _yearController,
      _locationController,
      _overviewController;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _modelNameController = TextEditingController(
      text: widget.carModel?.modelName,
    );
    _colorController = TextEditingController(
      text: widget.carModel?.color,
    );
    _speedController = TextEditingController(
      text: widget.carModel?.speed,
    );
    _priceController = TextEditingController(
      text: widget.carModel?.price,
    );
    _descriptionController = TextEditingController(
      text: widget.carModel?.description,
    );
    _yearController = TextEditingController(
      text: widget.carModel?.year,
    );
    _locationController = TextEditingController(
      text: widget.carModel?.location,
    );
    _overviewController = TextEditingController(
      text: widget.carModel?.overview,
    );
    super.initState();
  }

  @override
  void dispose() {
    _modelNameController.dispose();
    _colorController.dispose();
    _speedController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    _yearController.dispose();
    _locationController.dispose();
    _overviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCarCubit(),
      child: Builder(builder: (context) {
        return MultiBlocListener(
          listeners: [
            BlocListener<AddCarCubit, AddCarState>(
              listenWhen: (previous, current) =>
                  previous.carModel != current.carModel &&
                  current.carModel != null,
              listener: (context, state) {
                context.showSnackBar(
                  message: state.isUpdated
                      ? 'Car updated successfully'
                      : 'Car added successfully',
                  state: SnackBarStates.success,
                );
                context.navigator.maybePop(true);
              },
            ),
          ],
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      children: [
                        Expanded(
                          child: RoundedTextField(
                            controller: _modelNameController,
                            changed: (modelName) =>
                                _modelNameController.text = modelName,
                            hintText: 'Model Name',
                            validator: (modelName) {
                              if (modelName == null || modelName.isEmpty) {
                                return 'Please provide a model name';
                              }
                              return null;
                            },
                            icon: Icons.car_rental,
                          ),
                        ),
                        const Gap(10.0),
                        Expanded(
                          child: RoundedTextField(
                            controller: _colorController,
                            changed: (color) => _colorController.text = color,
                            hintText: 'Car Color',
                            validator: (color) {
                              if (color == null || color.isEmpty) {
                                return 'Please provide a color';
                              }
                              return null;
                            },
                            icon: Icons.color_lens,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      children: [
                        Expanded(
                          child: RoundedTextField(
                            controller: _yearController,
                            changed: (year) => _yearController.text = year,
                            validator: (year) {
                              if (year == null || year.isEmpty) {
                                return 'Please provide a year';
                              }
                              return null;
                            },
                            hintText: 'Car Year',
                            icon: Icons.calendar_today,
                          ),
                        ),
                        const Gap(10.0),
                        Expanded(
                          child: RoundedTextField(
                            hintText: 'Car Price',
                            controller: _priceController,
                            changed: (price) => _priceController.text = price,
                            validator: (price) {
                              if (price == null || price.isEmpty) {
                                return 'Please provide a price';
                              }
                              return null;
                            },
                            icon: Icons.money,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      children: [
                        Expanded(
                          child: RoundedTextField(
                            hintText: 'Car Speed',
                            controller: _speedController,
                            changed: (speed) => _speedController.text = speed,
                            validator: (speed) {
                              if (speed == null || speed.isEmpty) {
                                return 'Please provide a speed';
                              }
                              return null;
                            },
                            icon: Icons.speed,
                          ),
                        ),
                        const Gap(10),
                        Expanded(
                          child: RoundedTextField(
                            hintText: 'Car Description',
                            controller: _descriptionController,
                            changed: (description) =>
                                _descriptionController.text = description,
                            validator: (description) {
                              if (description == null || description.isEmpty) {
                                return 'Please provide a description';
                              }
                              return null;
                            },
                            icon: Icons.description,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      children: [
                        Expanded(
                          child: RoundedTextField(
                            hintText: 'Car Location',
                            controller: _locationController,
                            changed: (location) =>
                                _locationController.text = location,
                            validator: (location) {
                              if (location == null || location.isEmpty) {
                                return 'Please provide a location';
                              }
                              return null;
                            },
                            icon: Icons.location_on,
                          ),
                        ),
                        const Gap(10),
                        Expanded(
                          child: RoundedTextField(
                            hintText: 'Car Overview',
                            controller: _overviewController,
                            changed: (overview) =>
                                _overviewController.text = overview,
                            validator: (overview) {
                              if (overview == null || overview.isEmpty) {
                                return 'Please provide an overview';
                              }
                              return null;
                            },
                            icon: Icons.info,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(20),
                  BlocBuilder<AddCarCubit, AddCarState>(
                    buildWhen: (previous, current) =>
                        previous.isLoading != current.isLoading,
                    builder: (context, state) {
                      return AppButton(
                        onPressed: () async {
                          _formKey.currentState!.save();
                          if (_formKey.currentState!.validate()) {
                            final requestModel = AddCarRequestModel(
                              modelName: _modelNameController.text,
                              color: _colorController.text,
                              speed: _speedController.text,
                              price: _priceController.text,
                              description: _descriptionController.text,
                              year: _yearController.text,
                              location: _locationController.text,
                              overview: _overviewController.text,
                            );
                            widget.carModel != null
                                ? context.read<AddCarCubit>().updateCar(
                                      requestModel,
                                      widget.carModel!.id,
                                    )
                                : context
                                    .read<AddCarCubit>()
                                    .addCar(requestModel);
                          }
                        },
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        isLoading: state.isLoading,
                        width: context.screenWidth * 0.9,
                        label: widget.carModel != null ? 'Edit Car' : 'Add Car',
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
//
