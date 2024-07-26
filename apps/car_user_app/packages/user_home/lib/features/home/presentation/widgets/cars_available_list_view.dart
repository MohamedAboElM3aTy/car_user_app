import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:user_home/features/home/presentation/screens/car_details_screen.dart';
import 'package:user_home/features/home/presentation/widgets/car_holder_container.dart';

class CarsAvailableListView extends StatefulWidget {
  const CarsAvailableListView({
    super.key,
    this.height,
  });

  final double? height;

  @override
  State<CarsAvailableListView> createState() => _CarsAvailableListViewState();
}

class _CarsAvailableListViewState extends State<CarsAvailableListView> {
  late final CarListCubit _carListCubit;
  
  @override
  void initState() {
    super.initState();
    _carListCubit = BlocProvider.of<CarListCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.height ?? context.screenHeight * 0.6,
      left: 25.0,
      right: 25.0,
      bottom: 0.0,
      child: BlocBuilder<CarListCubit, CarListState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const ContainerShimmer();
          } else if (state.failure != null) {
            return Text(
              'Error: ${state.failure.toString()}',
            );
          } else if (state.cars.isEmpty) {
            return const EmptyScreen(
              message: 'No cars available',
            );
          } else if (state.cars.isNotEmpty) {
            return SingleChildScrollView(
              child: Column(
                children: List.generate(
                  state.cars.length,
                  (index) => InkWell(
                    onTap: () => context.navigator.push(
                      MaterialPageRoute(
                        builder: (_) => CarDetailsScreen(
                          car: state.cars[index],
                        ),
                      ),
                    ),
                    child: CarHolderContainer(
                      car: state.cars[index],
                    ),
                  ),
                ).toList().addSeparator(const Gap(20)),
              ),
            );
          } else {
            return const Text('No data');
          }
        },
      ),
    );
  }
}
