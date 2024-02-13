
class ProjectSettingsModel {
  bool financeVisible = true,
      marketingVisible = true,
      feasibilityStudyVisible = true,
      legalDocumentsVisible = true,
      mediaVisible = true,
      competitiveAdvantageVisible = true,
      workFlowVisible = true;

  ProjectSettingsModel(
      this.financeVisible,
      this.marketingVisible,
      this.feasibilityStudyVisible,
      this.legalDocumentsVisible,
      this.mediaVisible,
      this.competitiveAdvantageVisible,
      this.workFlowVisible);
}
