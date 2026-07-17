(set-logic QF_LIRA)
; var hasPriorWrittenConsentFromAdministrator (Bool): Whether prior written consent has been obtained from the Administrator before using any Agentic AI Tools
(declare-const hasPriorWrittenConsentFromAdministrator Bool)
; var isUsingAgenticAITools (Bool): Whether Agentic AI Tools are being used
(declare-const isUsingAgenticAITools Bool)
; var isAgenticAIToolUseAllowed (Bool): Whether the use of Agentic AI Tools is allowed
(declare-const isAgenticAIToolUseAllowed Bool)
; var isAutonomousAccessToSensitiveInformation (Bool): Whether there is autonomous access to Sensitive Information
(declare-const isAutonomousAccessToSensitiveInformation Bool)
; var hasAuthorizationForSensitiveInformationAccess (Bool): Whether authorization has been obtained for accessing Sensitive Information
(declare-const hasAuthorizationForSensitiveInformationAccess Bool)
; var isAutonomousAccessToSensitiveInformationAllowed (Bool): Whether autonomous access to Sensitive Information is allowed
(declare-const isAutonomousAccessToSensitiveInformationAllowed Bool)
; var isUnattendedTaskInvolvingClientData (Bool): Whether the task is an unattended task involving client data
(declare-const isUnattendedTaskInvolvingClientData Bool)
; var isFirmApprovedForUnattendedTask (Bool): Whether the unattended task has been approved by the Firm
(declare-const isFirmApprovedForUnattendedTask Bool)
; var isConfiguredToHaltOnError (Bool): Whether the unattended task is configured to halt on error
(declare-const isConfiguredToHaltOnError Bool)
; var isUnattendedTaskInvolvingClientDataAllowed (Bool): Whether unattended tasks involving client data are allowed
(declare-const isUnattendedTaskInvolvingClientDataAllowed Bool)
; var isChainingMultipleAgenticAITools (Bool): Whether multiple Agentic AI Tools are being chained together
(declare-const isChainingMultipleAgenticAITools Bool)
; var hasWrittenApprovalForChaining (Bool): Whether written approval has been obtained for chaining multiple Agentic AI Tools
(declare-const hasWrittenApprovalForChaining Bool)
; var isChainingMultipleAgenticAIToolsAllowed (Bool): Whether chaining multiple Agentic AI Tools is allowed
(declare-const isChainingMultipleAgenticAIToolsAllowed Bool)
; var isClientConfidentialInformation (Bool): Whether the information is Client Confidential Information
(declare-const isClientConfidentialInformation Bool)
; var isFirmProprietaryInformation (Bool): Whether the information is Firm proprietary information
(declare-const isFirmProprietaryInformation Bool)
; var isPersonalData (Bool): Whether the information is personal data
(declare-const isPersonalData Bool)
; var isMaterialNonpublicInformation (Bool): Whether the information is Material Nonpublic Information (MNPI)
(declare-const isMaterialNonpublicInformation Bool)
; var isInformationSubjectToPrivilege (Bool): Whether the information is subject to privilege protection
(declare-const isInformationSubjectToPrivilege Bool)
; var isInformationSubjectToWorkProductProtection (Bool): Whether the information is subject to work product protection
(declare-const isInformationSubjectToWorkProductProtection Bool)
; var isSensitiveInformation (Bool): Whether the information qualifies as Sensitive Information, which includes Client Confidential Information, Firm proprietary information, personal data, Material Nonpublic Information (MNPI), and any information subject to privilege or work product protection
(declare-const isSensitiveInformation Bool)
; Rule AOO00S5IT4OS (if isUsingAgenticAITools is true, then isAgenticAIToolUseAllowed is equal to hasPriorWrittenConsentFromAdministrator)
(assert (=> isUsingAgenticAITools
    (= isAgenticAIToolUseAllowed
       hasPriorWrittenConsentFromAdministrator)))
; Rule JIN52GHBHRKW (isAutonomousAccessToSensitiveInformationAllowed is equal to hasAuthorizationForSensitiveInformationAccess)
(assert (= isAutonomousAccessToSensitiveInformationAllowed
   hasAuthorizationForSensitiveInformationAccess))
; Rule IC65RZDD3RVY (if isAutonomousAccessToSensitiveInformation is true and hasAuthorizationForSensitiveInformationAccess is false, then isAutonomousAccessToSensitiveInformationAllowed is false)
(assert (=> (and isAutonomousAccessToSensitiveInformation
         (not hasAuthorizationForSensitiveInformationAccess))
    (not isAutonomousAccessToSensitiveInformationAllowed)))
; Rule Z9SCWLBOXG79 (isChainingMultipleAgenticAIToolsAllowed is equal to hasWrittenApprovalForChaining)
(assert (= isChainingMultipleAgenticAIToolsAllowed
   hasWrittenApprovalForChaining))
; Rule M74LW5GC6LQO (if isChainingMultipleAgenticAITools is true and hasWrittenApprovalForChaining is false, then isChainingMultipleAgenticAIToolsAllowed is false)
(assert (=> (and isChainingMultipleAgenticAITools
         (not hasWrittenApprovalForChaining))
    (not isChainingMultipleAgenticAIToolsAllowed)))
; Rule ZPZ1EJ96S0LR (if isUnattendedTaskInvolvingClientDataAllowed is true, then isFirmApprovedForUnattendedTask is true)
(assert (=> isUnattendedTaskInvolvingClientDataAllowed
    isFirmApprovedForUnattendedTask))
; Rule HQ844ZMGF1TW (if isUnattendedTaskInvolvingClientDataAllowed is true, then isConfiguredToHaltOnError is true)
(assert (=> isUnattendedTaskInvolvingClientDataAllowed
    isConfiguredToHaltOnError))
; Rule Y9WK562OXPJK (if isUnattendedTaskInvolvingClientDataAllowed is false, then isFirmApprovedForUnattendedTask is false or isConfiguredToHaltOnError is false)
(assert (=> (not isUnattendedTaskInvolvingClientDataAllowed)
    (or (not isFirmApprovedForUnattendedTask)
        (not isConfiguredToHaltOnError))))
; Rule E5XFJJQ31GO2 (if isUnattendedTaskInvolvingClientData is true and isFirmApprovedForUnattendedTask is false, then isUnattendedTaskInvolvingClientDataAllowed is false)
(assert (=> (and isUnattendedTaskInvolvingClientData
         (not isFirmApprovedForUnattendedTask))
    (not isUnattendedTaskInvolvingClientDataAllowed)))
; Rule ODKN6ZJ5C983 (if isUnattendedTaskInvolvingClientData is true and isConfiguredToHaltOnError is false, then isUnattendedTaskInvolvingClientDataAllowed is false)
(assert (=> (and isUnattendedTaskInvolvingClientData
         (not isConfiguredToHaltOnError))
    (not isUnattendedTaskInvolvingClientDataAllowed)))
; Rule PALJCD7UUS4B (if isSensitiveInformation is true, then at least one of the following 6 statements is true: 1) isClientConfidentialInformation is true; 2) isFirmProprietaryInformation is true; 3) isPersonalData is true; 4) isMaterialNonpublicInformation is true; 5) isInformationSubjectToPrivilege is true; 6) isInformationSubjectToWorkProductProtection is true)
(assert (=> isSensitiveInformation
    (or isClientConfidentialInformation
        isFirmProprietaryInformation
        isPersonalData
        isMaterialNonpublicInformation
        isInformationSubjectToPrivilege
        isInformationSubjectToWorkProductProtection)))
; Rule TP1ZAM8HQKFV (if isSensitiveInformation is false, then isClientConfidentialInformation is false)
(assert (=> (not isSensitiveInformation)
    (not isClientConfidentialInformation)))
; Rule I6MREMNX8E0A (if isSensitiveInformation is false, then isFirmProprietaryInformation is false)
(assert (=> (not isSensitiveInformation)
    (not isFirmProprietaryInformation)))
; Rule UDTZ8MF7Z8TA (if isSensitiveInformation is false, then isPersonalData is false)
(assert (=> (not isSensitiveInformation)
    (not isPersonalData)))
; Rule NFBQWIHKQ2DL (if isSensitiveInformation is false, then isMaterialNonpublicInformation is false)
(assert (=> (not isSensitiveInformation)
    (not isMaterialNonpublicInformation)))
; Rule MX2X1PJ31KUF (if isSensitiveInformation is false, then isInformationSubjectToPrivilege is false)
(assert (=> (not isSensitiveInformation)
    (not isInformationSubjectToPrivilege)))
; Rule WGT4599HKHSJ (if isSensitiveInformation is false, then isInformationSubjectToWorkProductProtection is false)
(assert (=> (not isSensitiveInformation)
    (not isInformationSubjectToWorkProductProtection)))
(check-sat)
(get-model)
