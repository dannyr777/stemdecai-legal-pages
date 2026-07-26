# STEMDecAI legal pages

This folder contains deployable static pages for GitHub Pages:

- `index.html`
- `privacy.html`
- `terms.html`
- `support.html`
- `styles.css`
- `assets/stemdecai-logo.png`
- `assets/favicon.png`
- `assets/stemdecai-logo.svg`
- `assets/favicon.svg`
- `scripts/generate-logo-assets.ps1`

## Publish with GitHub Pages

1. Create a public repository such as `stemdecai-legal-pages`.
2. Upload all files from this folder to the repository root.
3. Open **Settings > Pages**.
4. Under **Build and deployment**, select **Deploy from a branch**.
5. Select the `main` branch and `/ (root)`.
6. Save and wait for GitHub to publish the site.

Expected URLs:

- `https://YOUR-USERNAME.github.io/stemdecai-legal-pages/privacy.html`
- `https://YOUR-USERNAME.github.io/stemdecai-legal-pages/terms.html`
- `https://YOUR-USERNAME.github.io/stemdecai-legal-pages/support.html`

## Verify before publishing

These files use a practical baseline based on the planned STEMDecAI product. Confirm each item against the released app:

- App name is exactly `STEMDecAI` everywhere public.
- Company name is exactly `Aivaryn Pty Ltd`.
- Company website is `https://aivaryn.com.au`.
- `support@aivaryn.com.au` exists and is monitored.
- `privacy@aivaryn.com.au` exists and is monitored.
- Effective dates match the launch or update date.
- Account creation and account deletion behaviour are described accurately.
- The in-app deletion path is really `Profile > Settings > Legal and Support > Delete Account`.
- Whether the app collects age range, school year, or learning level.
- Whether the app stores prompts, quiz answers, progress, streaks, bookmarks, or uploaded content.
- Which AI, analytics, crash reporting, advertising, authentication, cloud, and subscription providers are used.
- Whether Firebase Analytics, Firebase Crashlytics, RevenueCat, Apple, or Google purchase handling are enabled.
- Whether advertising is displayed and whether it is personalised.
- Whether the app is intended for children, students, adults, or a mixed audience.
- What parental consent, age gate, or school-authorised access is implemented.
- Overseas processing locations and providers.
- Subscription, trial, renewal, cancellation, and refund behaviour.
- App Store and Google Play privacy disclosures match the policy.

Delete any statement that does not reflect the actual production app. Add any collection,
sharing, or provider not currently covered.

## Mobile app legal links

Add these links under `Profile > Settings > Legal and Support`:

- Privacy Policy
- Terms of Use
- Support
- Delete Account
- Contact Us
- App Version

## Important

This is a strong publishing template, not legal advice. Obtain professional legal review
before launch, especially because STEMDecAI may be used by children or students.
