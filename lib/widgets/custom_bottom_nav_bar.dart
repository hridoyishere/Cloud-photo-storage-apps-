import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  // Icons order: Photos(0), Liked(1), Trash(2), Add(3 - special), Profile(4)
  static const _items = [
    _NavItem(icon: Icons.photo_library_outlined, active: Icons.photo_library, label: 'Photos'),
    _NavItem(icon: Icons.favorite_border, active: Icons.favorite, label: 'Liked'),
    _NavItem(icon: Icons.delete_outline, active: Icons.delete, label: 'Trash'),
    _NavItem(icon: Icons.add, active: Icons.add, label: 'Add'),
    _NavItem(icon: Icons.person_outline, active: Icons.person, label: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Container(
          height: 68,
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF1E1E24) : Colors.white,
            borderRadius: BorderRadius.circular(34),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(isDark ? 0.4 : 0.08),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(_items.length, (i) {
              // The "Add" button (index 3) is rendered specially
              if (i == 3) {
                return _AddButton(
                  isSelected: currentIndex == i,
                  onTap: () => onTap(i),
                );
              }
              return _NavItemWidget(
                item: _items[i],
                isSelected: currentIndex == i,
                onTap: () => onTap(i),
              );
            }),
          ),
        ),
      ),
    );
  }
}

/* ---------- Item model ---------- */
class _NavItem {
  final IconData icon;
  final IconData active;
  final String label;
  const _NavItem({required this.icon, required this.active, required this.label});
}

/* ---------- Regular nav item ---------- */
class _NavItemWidget extends StatelessWidget {
  final _NavItem item;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItemWidget({
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOutCubic,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: isSelected ? primary.withOpacity(0.12) : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                isSelected ? item.active : item.icon,
                size: 24,
                color: isSelected
                    ? primary
                    : Theme.of(context).iconTheme.color?.withOpacity(0.6) ??
                        Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 2),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: isSelected ? 1 : 0,
              child: Text(
                item.label,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* ---------- Special "Add" button ---------- */
class _AddButton extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;

  const _AddButton({required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: 52,
        height: 52,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [primary, primary.withOpacity(0.7)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: primary.withOpacity(0.45),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
          border: isSelected ? Border.all(color: Colors.white, width: 2.5) : null,
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }
}