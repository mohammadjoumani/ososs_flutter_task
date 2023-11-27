import 'package:flutter/material.dart';
import 'package:ososs_flutter_task/core/utils/resource/color_manager.dart';
import 'package:ososs_flutter_task/core/utils/resource/font_manager.dart';
import 'package:ososs_flutter_task/core/utils/resource/style_manager.dart';
import 'package:ososs_flutter_task/core/utils/resource/values_manager.dart';
import 'package:ososs_flutter_task/features/pokemons/domain/entities/pokemon.dart';

class ItemPokemon extends StatelessWidget {
  const ItemPokemon({super.key, required this.index, required this.pokemon});

  final int index;
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.colorWhite,
        borderRadius: BorderRadius.circular(AppSize.s10),
        boxShadow: [
          BoxShadow(
            color: ColorManager.colorBlack.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: ColorManager.colorBlack.withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppSize.s10),
            ),
            child: Image.network(
              "${pokemon.image}${index + 1}.png",
              fit: BoxFit.contain,
              width: 125,
              height: 130,
              errorBuilder: (ctx, _, e) {
                return const FlutterLogo(
                  size: 125,
                );
              },
            ),
          ),
          const SizedBox(width: AppPadding.p16),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: Text(
              pokemon.name,
              style: Styles.getMediumStyle(
                  color: ColorManager.colorBlack, fontSize: FontSize.s16),
            ),
          ),
        ],
      ),
    );
  }
}
