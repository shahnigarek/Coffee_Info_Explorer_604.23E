import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/coffee_model.dart';

class CoffeeCard extends StatefulWidget {
  final CoffeeModel coffee;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteToggle;

  const CoffeeCard({
    Key? key,
    required this.coffee,
    this.onTap,
    this.onFavoriteToggle,
  }) : super(key: key);

  @override
  State<CoffeeCard> createState() => _CoffeeCardState();
}

class _CoffeeCardState extends State<CoffeeCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                      child: Image.asset(
                        widget.coffee.imageAsset,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 6),
                      child: Center(
                        child: _isHovered
                            ? Text(
                                widget.coffee.description,
                                style: GoogleFonts.robotoMono(
                                  fontSize: 13,
                                  color: Colors.white60,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              )
                            : Text(
                                widget.coffee.name,
                                style: GoogleFonts.robotoMono(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 12,
                right: 15,
                child: GestureDetector(
                  onTap: () {
                    widget.onFavoriteToggle?.call();
                  },
                  child: Icon(
                    widget.coffee.isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: widget.coffee.isFavorite
                        ? Colors.redAccent
                        : Colors.white,
                    size: 22,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
