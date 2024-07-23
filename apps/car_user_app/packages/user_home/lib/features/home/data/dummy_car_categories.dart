import 'package:core/app/constants/app_colors.dart';
import 'package:core/app/constants/app_images.dart';
import 'package:user_home/features/home/domain/car_category.dart';

List<CarCategory> carCategories = [
  CarCategory(
    carPicture: AppImages.camaroImage,
    categoryName: 'Camaro',
    categoryHint: '245 cars',
    circleColor: AppColors.redCircleColor,
  ),
  CarCategory(
    carPicture: AppImages.toyotaImage,
    categoryName: 'Toyota',
    categoryHint: '808 cars',
    circleColor: AppColors.purpleCircleColor,
  ),
  CarCategory(
    carPicture: AppImages.teslaImage,
    categoryName: 'Tesla',
    categoryHint: '1250 cars',
    circleColor: AppColors.yellowCircleColor,
  ),
  CarCategory(
    carPicture: AppImages.bmwImage,
    categoryName: 'BMW',
    categoryHint: '189 cars',
    circleColor: AppColors.blueCircleColor,
  ),
  CarCategory(
    carPicture: AppImages.chevroImage,
    categoryName: 'Chevrolet',
    categoryHint: '2487 cars',
    circleColor: AppColors.redPurpleCircleColor,
  ),
];
