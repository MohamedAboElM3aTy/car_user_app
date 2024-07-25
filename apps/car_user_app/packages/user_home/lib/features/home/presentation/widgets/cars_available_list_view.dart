import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
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
  @override
  void initState() {
    super.initState();
    _fetchCars();
  }

  // TODO: To transfer to cubit
  Future<List<CarModel>> _fetchCars() async {
    try {
      final response =
          await Supabase.instance.client.from('car_table').select('*');
      return response.map((car) => CarModel.fromMap(car)).toList();
    } catch (error) {
      debugPrint('Error fetching cars from Supabase: ${error.toString()}');
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.height ?? context.screenHeight * 0.6,
      left: 25.0,
      right: 25.0,
      bottom: 0.0,
      child: FutureBuilder<List<CarModel>>(
        future: _fetchCars(),
        builder: (context, carsSnapshot) {
          if (carsSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: ContainerShimmer());
          } else if (carsSnapshot.hasError) {
            return Text(
              'Error: ${carsSnapshot.error.toString()}',
            );
          } else if (!carsSnapshot.hasData || carsSnapshot.data!.isEmpty) {
            return const Text(
              'No cars available.',
            );
          } else if (carsSnapshot.hasData) {
            return SingleChildScrollView(
              child: Column(
                children: List.generate(
                  carsSnapshot.data!.length,
                  (index) => InkWell(
                    onTap: () => context.navigator.push(
                      MaterialPageRoute(
                        builder: (_) => CarDetailsScreen(
                          car: carsSnapshot.data![index],
                        ),
                      ),
                    ),
                    child: CarHolderContainer(
                      car: carsSnapshot.data![index],
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
