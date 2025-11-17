import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glypha/app/routes/route_paths.dart';
import 'package:glypha/features/auth/presentation/provider/auth_notifier.dart';
import 'package:glypha/features/auth/presentation/provider/onboarding_notifier.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class AdditionalDetailsPage extends ConsumerStatefulWidget {
  const AdditionalDetailsPage({super.key});

  static const route = '/additionalDetails';

  @override
  ConsumerState<AdditionalDetailsPage> createState() =>
      _AdditionalDetailsPageState();
}

class _AdditionalDetailsPageState extends ConsumerState<AdditionalDetailsPage> {
  final PageController _pageController = PageController();
  final List<GlobalKey<FormState>> _formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final onboardingState = ref.watch(onboardingNotifierProvider);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Progress indicator with step labels
            _buildProgressHeader(onboardingState.currentStep, theme),

            // Content with page view for smooth transitions
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _PhoneStep(formKey: _formKeys[0]),
                  _EducationStep(formKey: _formKeys[1]),
                  _InterestsStep(formKey: _formKeys[2]),
                ],
              ),
            ),

            // Navigation buttons
            _BottomNavigation(
              currentStep: onboardingState.currentStep,
              pageController: _pageController,
              formKeys: _formKeys,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressHeader(int currentStep, ThemeData theme) {
    const steps = ['Contact', 'Education', 'Interests'];

    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          // Step labels
          Row(
            children: steps.asMap().entries.map((entry) {
              final index = entry.key;
              final label = entry.value;
              return Expanded(
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: index <= currentStep ? 1.0 : 0.5,
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.labelSmall?.copyWith(
                      fontWeight: index == currentStep
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 12),

          // Progress bar
          Row(
            children: List.generate(
              3,
              (index) => Expanded(
                child: Container(
                  height: 4,
                  margin: EdgeInsets.only(right: index < 2 ? 4 : 0),
                  decoration: BoxDecoration(
                    color: index <= currentStep
                        ? theme.colorScheme.primary
                        : theme.colorScheme.primary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Separate widget for phone step with proper validation
class _PhoneStep extends ConsumerStatefulWidget {
  final GlobalKey<FormState> formKey;

  const _PhoneStep({required this.formKey});

  @override
  ConsumerState<_PhoneStep> createState() => _PhoneStepState();
}

class _PhoneStepState extends ConsumerState<_PhoneStep> {
  PhoneNumber number = PhoneNumber(isoCode: 'NG');
  String? finalPhone;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Form(
      key: widget.formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              "What's your phone number?",
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "We'll use this for important updates and account security.",
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onBackground.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: 40),
            InternationalPhoneNumberInput(
              onInputChanged: (PhoneNumber value) {
                number = value;

                if (value.phoneNumber != null) {
                  ref
                      .read(onboardingNotifierProvider.notifier)
                      .setPhoneNumber(value.phoneNumber!);
                }
              },
              onInputValidated: (bool isValid) {
                if (isValid && finalPhone != null) {
                  ref
                      .read(onboardingNotifierProvider.notifier)
                      .setPhoneNumber(finalPhone!);
                }
              },
              selectorConfig: const SelectorConfig(
                selectorType: PhoneInputSelectorType.DROPDOWN,
              ),
              textFieldController: TextEditingController(),
              initialValue: number,
              formatInput: true,
              inputDecoration: const InputDecoration(
                labelText: "Phone Number",
                hintText: "801 234 5678",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your phone number";
                }
                return null;
              },
              onSaved: (phone) {
                finalPhone = phone.phoneNumber;
              },
            ),
            const SizedBox(height: 8),
            Text(
              'We may send you verification codes for security',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onBackground.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Education step as separate widget
class _EducationStep extends ConsumerWidget {
  final GlobalKey<FormState> formKey;

  const _EducationStep({required this.formKey});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final onboardingState = ref.watch(onboardingNotifierProvider);

    return Form(
      key: formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              "What's your education level?",
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "This helps us tailor content to your learning needs.",
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onBackground.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: 40),

            // Education options
            ..._EducationLevels.all.map(
              (level) => _SelectableCard(
                title: level.name,
                subtitle: level.description,
                icon: level.icon,
                isSelected: onboardingState.educationLevel == level.name,
                onTap: () {
                  ref
                      .read(onboardingNotifierProvider.notifier)
                      .setEducationLevel(level.name);
                  formKey.currentState?.validate();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Interests step as separate widget
class _InterestsStep extends ConsumerWidget {
  final GlobalKey<FormState> formKey;

  const _InterestsStep({required this.formKey});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final onboardingState = ref.watch(onboardingNotifierProvider);

    return Form(
      key: formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              "What are your interests?",
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "Select 2-5 subjects you'd like to focus on.",
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onBackground.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: 40),

            // Interest chips
            _InterestChipsGrid(
              selectedInterests: onboardingState.interests,
              onInterestToggled: (interest) {
                ref
                    .read(onboardingNotifierProvider.notifier)
                    .toggleInterest(interest);
                formKey.currentState?.validate();
              },
            ),

            // Selection feedback
            if (onboardingState.interests.isNotEmpty) ...[
              const SizedBox(height: 20),
              Text(
                'Selected: ${onboardingState.interests.length}',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// Bottom navigation component
class _BottomNavigation extends ConsumerWidget {
  final int currentStep;
  final PageController pageController;
  final List<GlobalKey<FormState>> formKeys;

  const _BottomNavigation({
    required this.currentStep,
    required this.pageController,
    required this.formKeys,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final onboardingState = ref.watch(onboardingNotifierProvider);
    final authState = ref.watch(authNotifierProvider);

    bool _validateCurrentStep() {
      return formKeys[currentStep].currentState?.validate() ?? false;
    }

    bool _canProceed() {
      switch (currentStep) {
        case 0: // Phone
          return onboardingState.phoneNumber.isNotEmpty &&
              onboardingState.phoneNumber.length > 10;
        case 1: // Education
          return onboardingState.educationLevel.isNotEmpty;
        case 2: // Interests
          return onboardingState.interests.length >= 2;
        default:
          return false;
      }
    }

    Future<void> _submitData() async {
      final user = authState.maybeWhen(
        authenticated: (user) => user,
        orElse: () => null,
      );

      if (user != null) {
        final success = await ref
            .read(onboardingNotifierProvider.notifier)
            .submitDetails(user.id);

        if (success && context.mounted) {
          context.goNamed(AppRoute.home.name);
        } else if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                onboardingState.error?.message ?? 'Failed to save details',
              ),
              backgroundColor: theme.colorScheme.error,
            ),
          );
        }
      }
    }

    void _goToNextStep() {
      if (_validateCurrentStep() && _canProceed()) {
        formKeys[currentStep].currentState?.save();

        if (_canProceed()) {
          if (currentStep < 2) {
            pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
            ref.read(onboardingNotifierProvider.notifier).nextStep();
          } else {
            _submitData();
          }
        }
      }
    }

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            // Back button
            if (currentStep > 0)
              Expanded(
                child: OutlinedButton(
                  onPressed: onboardingState.isLoading
                      ? null
                      : () {
                          pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                          ref
                              .read(onboardingNotifierProvider.notifier)
                              .previousStep();
                        },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('Back'),
                ),
              ),
            if (currentStep > 0) const SizedBox(width: 12),

            // Continue/Complete button
            Expanded(
              flex: 2,
              child: ElevatedButton(
                onPressed: onboardingState.isLoading ? null : _goToNextStep,
                child: onboardingState.isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : Text(
                        currentStep < 2 ? 'Continue' : 'Get Started',
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Supporting data classes and widgets
class _EducationLevel {
  final String name;
  final String description;
  final IconData icon;

  const _EducationLevel({
    required this.name,
    required this.description,
    required this.icon,
  });
}

class _EducationLevels {
  static const all = [
    _EducationLevel(
      name: 'High School',
      description: 'Preparing for university entrance',
      icon: Icons.school,
    ),
    _EducationLevel(
      name: 'Undergraduate',
      description: 'Currently in university',
      icon: Icons.assignment_ind,
    ),
    _EducationLevel(
      name: 'Graduate',
      description: 'Postgraduate studies',
      icon: Icons.workspace_premium,
    ),
    _EducationLevel(
      name: 'Professional',
      description: 'Career development',
      icon: Icons.work,
    ),
  ];
}

class _SelectableCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _SelectableCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Card(
        color: isSelected
            ? theme.colorScheme.primary.withOpacity(0.05)
            : theme.colorScheme.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: isSelected
                ? theme.colorScheme.primary
                : theme.colorScheme.outline.withOpacity(0.2),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: isSelected
                      ? theme.colorScheme.primary
                      : theme.colorScheme.onSurface.withOpacity(0.6),
                  size: 24,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: isSelected
                              ? theme.colorScheme.primary
                              : theme.colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurface.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Icon(
                  isSelected
                      ? Icons.check_circle
                      : Icons.radio_button_unchecked,
                  color: isSelected
                      ? theme.colorScheme.primary
                      : theme.colorScheme.onSurface.withOpacity(0.4),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _InterestChipsGrid extends StatelessWidget {
  final List<String> selectedInterests;
  final ValueChanged<String> onInterestToggled;

  const _InterestChipsGrid({
    required this.selectedInterests,
    required this.onInterestToggled,
  });

  @override
  Widget build(BuildContext context) {
    const interests = [
      'Mathematics',
      'Physics',
      'Chemistry',
      'Biology',
      'English',
      'History',
      'Geography',
      'Economics',
      'Computer Science',
      'Art',
      'Music',
      'Sports',
    ];

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: interests.map((interest) {
        final isSelected = selectedInterests.contains(interest);
        return FilterChip(
          selected: isSelected,
          onSelected: (_) => onInterestToggled(interest),
          label: Text(interest),
          showCheckmark: true,
        );
      }).toList(),
    );
  }
}
