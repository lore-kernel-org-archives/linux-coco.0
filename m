Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D2B8F6B
	for <linux-coco@lists.linux.dev>; Tue,  3 Jan 2023 21:05:16 +0000 (UTC)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 303Jwp1A023514
	for <linux-coco@lists.linux.dev>; Tue, 3 Jan 2023 21:05:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=r1n0U1Bv8bcay/fa0DOAwpFBfwc/dEGfit7xA7WmZbI=;
 b=kIQ7wWtPDpmHPO1H8oarxE1+qyW8Uhgi/zP0f2wvj5FYMxvrJkQSGhrIy/d3oJRCj6WP
 L46d9JMvWlWsZAH/8N+dApYOl1LgpVgeBbQ2OvE6pS1/9gs9YGC/6vdYVW6EBFxiampt
 nkJRGczxSRazpBZHHzlODfcunf7R8l1LZZnhcmP0pEv4/jN4z5UENA9bWQYZ7EvHDLux
 NS6p4XJ4rdhP2NHW+GunZNQ27B21fYY+NVF8xS0R8oFX0p4xEejkyIYS43kI1tz5FL8u
 Kg+IbsbV4eziU8Blj53m5f0hFCfOp2OnzHFe98FH0dUUpsbbm13/2K73TlkoEBU6A1Lv bA== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mvm4241rw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-coco@lists.linux.dev>; Tue, 03 Jan 2023 21:05:15 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 303KEQE0030482
	for <linux-coco@lists.linux.dev>; Tue, 3 Jan 2023 21:05:15 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
	by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3mtcq7gw6w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-coco@lists.linux.dev>; Tue, 03 Jan 2023 21:05:14 +0000
Received: from b03ledav004.gho.boulder.ibm.com ([9.17.130.235])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 303L5Dll36766220
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-coco@lists.linux.dev>; Tue, 3 Jan 2023 21:05:13 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 544027805F
	for <linux-coco@lists.linux.dev>; Tue,  3 Jan 2023 22:37:39 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E3DCD7805E
	for <linux-coco@lists.linux.dev>; Tue,  3 Jan 2023 22:37:38 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.211.64.53])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP
	for <linux-coco@lists.linux.dev>; Tue,  3 Jan 2023 22:37:38 +0000 (GMT)
Message-ID: <20c7dda843f93b22f6c6afca3820a53d669503bf.camel@linux.ibm.com>
Subject: [RFC 3/3] edk2: Add SVSM based vTPM
From: James Bottomley <jejb@linux.ibm.com>
Reply-To: jejb@linux.ibm.com
To: linux-coco@lists.linux.dev
Date: Tue, 03 Jan 2023 16:05:11 -0500
In-Reply-To: <acb06bc7f329dfee21afa1b2ff080fe29b799021.camel@linux.ibm.com>
References: <acb06bc7f329dfee21afa1b2ff080fe29b799021.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: t9FoPSF_LI_Qz94U-2kEe_XJyTieOa1m
X-Proofpoint-GUID: t9FoPSF_LI_Qz94U-2kEe_XJyTieOa1m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-03_07,2023-01-03_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 clxscore=1015 spamscore=0
 mlxlogscore=714 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301030178

From: James Bottomley <James.Bottomley@HansenPartnership.com>

Add this as a new device in TPM2DeviceLibDTpm.  The SVSM vTPM has no
physical presence interface, so handle detecing this device before
that check.  The detection is done by sending all zeros to the SVSM
for the VTPM function (8) and seeing if success is returned.

Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>
---
 .../Tpm2DeviceLibDTpm/Tpm2DeviceLibDTpm.inf   |  3 +
 .../Tpm2DeviceLibDTpmStandaloneMm.inf         |  3 +
 .../Tpm2DeviceLibDTpm/Tpm2InstanceLibDTpm.inf |  3 +
 SecurityPkg/Include/Library/Tpm2DeviceLib.h   |  1 +
 .../Tpm2DeviceLibDTpm/Tpm2DeviceLibDTpm.h     | 33 +++++++
 UefiCpuPkg/Include/Library/VmgExitLib.h       |  6 ++
 OvmfPkg/Library/VmgExitLib/VmgExitSvsm.c      | 36 +++++++
 .../Library/Tpm2DeviceLibDTpm/Tpm2Ptp.c       | 14 +++
 .../Library/Tpm2DeviceLibDTpm/Tpm2Svsm.c      | 96 +++++++++++++++++++
 .../Library/VmgExitLibNull/VmgExitLibNull.c   | 23 +++++
 10 files changed, 218 insertions(+)
 create mode 100644 SecurityPkg/Library/Tpm2DeviceLibDTpm/Tpm2Svsm.c

diff --git a/SecurityPkg/Library/Tpm2DeviceLibDTpm/Tpm2DeviceLibDTpm.inf b/SecurityPkg/Library/Tpm2DeviceLibDTpm/Tpm2DeviceLibDTpm.inf
index be3a0053ccce..2cd5216a0d42 100644
--- a/SecurityPkg/Library/Tpm2DeviceLibDTpm/Tpm2DeviceLibDTpm.inf
+++ b/SecurityPkg/Library/Tpm2DeviceLibDTpm/Tpm2DeviceLibDTpm.inf
@@ -33,6 +33,7 @@ [Defines]
 
 [Sources]
   Tpm2Tis.c
+  Tpm2Svsm.c
   Tpm2Ptp.c
   Tpm2DeviceLibDTpm.c
   Tpm2DeviceLibDTpmBase.c
@@ -41,6 +42,7 @@ [Sources]
 [Packages]
   MdePkg/MdePkg.dec
   SecurityPkg/SecurityPkg.dec
+  UefiCpuPkg/UefiCpuPkg.dec
 
 [LibraryClasses]
   BaseLib
@@ -49,6 +51,7 @@ [LibraryClasses]
   TimerLib
   DebugLib
   PcdLib
+  VmgExitLib
 
 [Pcd]
   gEfiSecurityPkgTokenSpaceGuid.PcdTpmBaseAddress            ## CONSUMES
diff --git a/SecurityPkg/Library/Tpm2DeviceLibDTpm/Tpm2DeviceLibDTpmStandaloneMm.inf b/SecurityPkg/Library/Tpm2DeviceLibDTpm/Tpm2DeviceLibDTpmStandaloneMm.inf
index 18c08ad8bdcc..99b140be1c54 100644
--- a/SecurityPkg/Library/Tpm2DeviceLibDTpm/Tpm2DeviceLibDTpmStandaloneMm.inf
+++ b/SecurityPkg/Library/Tpm2DeviceLibDTpm/Tpm2DeviceLibDTpmStandaloneMm.inf
@@ -33,6 +33,7 @@ [Defines]
 
 [Sources]
   Tpm2Tis.c
+  Tpm2Svsm.c
   Tpm2Ptp.c
   Tpm2DeviceLibDTpm.c
   Tpm2DeviceLibDTpmStandaloneMm.c
@@ -41,6 +42,7 @@ [Sources]
 [Packages]
   MdePkg/MdePkg.dec
   SecurityPkg/SecurityPkg.dec
+  UefiCpuPkg/UefiCpuPkg.dec
 
 [LibraryClasses]
   BaseLib
@@ -49,6 +51,7 @@ [LibraryClasses]
   TimerLib
   DebugLib
   PcdLib
+  VmgExitLib
 
 [Pcd]
   gEfiSecurityPkgTokenSpaceGuid.PcdTpmBaseAddress            ## CONSUMES
diff --git a/SecurityPkg/Library/Tpm2DeviceLibDTpm/Tpm2InstanceLibDTpm.inf b/SecurityPkg/Library/Tpm2DeviceLibDTpm/Tpm2InstanceLibDTpm.inf
index 31113d93ee41..7c41ab0a8531 100644
--- a/SecurityPkg/Library/Tpm2DeviceLibDTpm/Tpm2InstanceLibDTpm.inf
+++ b/SecurityPkg/Library/Tpm2DeviceLibDTpm/Tpm2InstanceLibDTpm.inf
@@ -29,6 +29,7 @@ [Defines]
 
 [Sources]
   Tpm2Tis.c
+  Tpm2Svsm.c
   Tpm2Ptp.c
   Tpm2InstanceLibDTpm.c
   Tpm2DeviceLibDTpmBase.c
@@ -37,6 +38,7 @@ [Sources]
 [Packages]
   MdePkg/MdePkg.dec
   SecurityPkg/SecurityPkg.dec
+  UefiCpuPkg/UefiCpuPkg.dec
 
 [LibraryClasses]
   BaseLib
@@ -45,6 +47,7 @@ [LibraryClasses]
   TimerLib
   DebugLib
   PcdLib
+  VmgExitLib
 
 [Pcd]
   gEfiSecurityPkgTokenSpaceGuid.PcdTpmBaseAddress          ## CONSUMES
diff --git a/SecurityPkg/Include/Library/Tpm2DeviceLib.h b/SecurityPkg/Include/Library/Tpm2DeviceLib.h
index 783bfa533394..b45ea0d07eb4 100644
--- a/SecurityPkg/Include/Library/Tpm2DeviceLib.h
+++ b/SecurityPkg/Include/Library/Tpm2DeviceLib.h
@@ -18,6 +18,7 @@ typedef enum {
   Tpm2PtpInterfaceTis,
   Tpm2PtpInterfaceFifo,
   Tpm2PtpInterfaceCrb,
+  Tpm2PtpInterfaceSvsm,
   Tpm2PtpInterfaceMax,
 } TPM2_PTP_INTERFACE_TYPE;
 
diff --git a/SecurityPkg/Library/Tpm2DeviceLibDTpm/Tpm2DeviceLibDTpm.h b/SecurityPkg/Library/Tpm2DeviceLibDTpm/Tpm2DeviceLibDTpm.h
index d703f15a2fbb..8af67e31a757 100644
--- a/SecurityPkg/Library/Tpm2DeviceLibDTpm/Tpm2DeviceLibDTpm.h
+++ b/SecurityPkg/Library/Tpm2DeviceLibDTpm/Tpm2DeviceLibDTpm.h
@@ -64,4 +64,37 @@ InternalTpm2DeviceLibDTpmCommonConstructor (
   VOID
   );
 
+/**
+  Check if an SVSM based TPM is present
+
+  @retval TRUE    SVSM TPM is present
+  @retval FALSE   no SVSM TPM is present
+**/
+BOOLEAN
+Tpm2IsSvsm (
+  VOID
+  );
+
+/**
+  Send a command to TPM for execution and return response data.
+
+  @param[in]      BufferIn      Buffer for command data.
+  @param[in]      SizeIn        Size of command data.
+  @param[in, out] BufferOut     Buffer for response data.
+  @param[in, out] SizeOut       Size of response data.
+
+  @retval EFI_SUCCESS           Operation completed successfully.
+  @retval EFI_BUFFER_TOO_SMALL  Response data buffer is too small.
+  @retval EFI_DEVICE_ERROR      Unexpected device behavior.
+  @retval EFI_UNSUPPORTED       Unsupported TPM version
+
+**/
+EFI_STATUS
+Tpm2SvsmTpmCommand (
+  IN     UINT8                 *BufferIn,
+  IN     UINT32                SizeIn,
+  IN OUT UINT8                 *BufferOut,
+  IN OUT UINT32                *SizeOut
+  );
+
 #endif // _TPM2_DEVICE_LIB_DTPM_H_
diff --git a/UefiCpuPkg/Include/Library/VmgExitLib.h b/UefiCpuPkg/Include/Library/VmgExitLib.h
index f32938e8f262..4b65bcba780c 100644
--- a/UefiCpuPkg/Include/Library/VmgExitLib.h
+++ b/UefiCpuPkg/Include/Library/VmgExitLib.h
@@ -242,4 +242,10 @@ VmgExitVmsaRmpAdjust (
   IN BOOLEAN           SetVmsa
   );
 
+BOOLEAN
+EFIAPI
+VmgExitVTPM (
+  IN OUT UINT8             *Buffer
+  );
+
 #endif
diff --git a/OvmfPkg/Library/VmgExitLib/VmgExitSvsm.c b/OvmfPkg/Library/VmgExitLib/VmgExitSvsm.c
index bbf8e5591a92..f3b169c4cba3 100644
--- a/OvmfPkg/Library/VmgExitLib/VmgExitSvsm.c
+++ b/OvmfPkg/Library/VmgExitLib/VmgExitSvsm.c
@@ -476,3 +476,39 @@ VmgExitVmsaRmpAdjust (
   return VmgExitSvsmPresent () ? SvsmVmsaRmpAdjust (Vmsa, ApicId, SetVmsa)
                                : BaseVmsaRmpAdjust (Vmsa, ApicId, SetVmsa);
 }
+
+
+/**
+  Tries to perform a SVSM call to the vTPM.
+
+  The buffer should contain a marshalled TPM command and will return a
+  marshalled TPM response.  Sending down a NULL buffer will do nothing but
+  can be used to probe for the existence of the SVSM vTPM (will return
+  non zero if no vTPM is present)
+
+  @param Buffer               A pointer to the input command and output response
+
+  @retval TRUE                The Command is processed (or the vTPM is present)
+  @retval FALSE               The vTPM is not present
+
+**/
+BOOLEAN
+EFIAPI
+VmgExitVTPM (
+  IN OUT UINT8             *Buffer
+  )
+{
+  SVSM_CAA                 *Caa;
+  SVSM_FUNCTION            Function;
+  UINTN                    Ret;
+
+  if (!VmgExitSvsmPresent ())
+    return FALSE;
+
+  Caa = SvsmGetCaa ();
+  Function.Protocol = 0;
+  Function.CallId = 8;
+
+  Ret = SvsmMsrProtocol (Caa, Function.Uint64, (UINT64)Buffer, 0, 0);
+  return (Ret == 0) ? TRUE : FALSE;
+}
diff --git a/SecurityPkg/Library/Tpm2DeviceLibDTpm/Tpm2Ptp.c b/SecurityPkg/Library/Tpm2DeviceLibDTpm/Tpm2Ptp.c
index 1d99beaa101f..19e4ddf3e09c 100644
--- a/SecurityPkg/Library/Tpm2DeviceLibDTpm/Tpm2Ptp.c
+++ b/SecurityPkg/Library/Tpm2DeviceLibDTpm/Tpm2Ptp.c
@@ -422,6 +422,11 @@ Tpm2GetPtpInterface (
   PTP_CRB_INTERFACE_IDENTIFIER   InterfaceId;
   PTP_FIFO_INTERFACE_CAPABILITY  InterfaceCapability;
 
+  if (Tpm2IsSvsm ()) {
+    DEBUG((DEBUG_INFO, "Found SVSM TPM\n"));
+    return Tpm2PtpInterfaceSvsm;
+  }
+
   if (!Tpm2IsPtpPresence (Register)) {
     return Tpm2PtpInterfaceMax;
   }
@@ -595,6 +600,13 @@ DTpm2SubmitCommand (
                OutputParameterBlock,
                OutputParameterBlockSize
                );
+    case Tpm2PtpInterfaceSvsm:
+      return Tpm2SvsmTpmCommand (
+	       InputParameterBlock,
+               InputParameterBlockSize,
+               OutputParameterBlock,
+               OutputParameterBlockSize
+               );
     default:
       return EFI_NOT_FOUND;
   }
@@ -622,6 +634,8 @@ DTpm2RequestUseTpm (
     case Tpm2PtpInterfaceFifo:
     case Tpm2PtpInterfaceTis:
       return TisPcRequestUseTpm ((TIS_PC_REGISTERS_PTR)(UINTN)PcdGet64 (PcdTpmBaseAddress));
+    case Tpm2PtpInterfaceSvsm:
+      return EFI_SUCCESS;
     default:
       return EFI_NOT_FOUND;
   }
diff --git a/SecurityPkg/Library/Tpm2DeviceLibDTpm/Tpm2Svsm.c b/SecurityPkg/Library/Tpm2DeviceLibDTpm/Tpm2Svsm.c
new file mode 100644
index 000000000000..ce0f162b9e01
--- /dev/null
+++ b/SecurityPkg/Library/Tpm2DeviceLibDTpm/Tpm2Svsm.c
@@ -0,0 +1,96 @@
+/** @file
+  SVSM TPM communication
+
+Copyright (c) 2023 James.Bottomley@HansenPartnership.com
+
+SPDX-License-Identifier: BSD-2-Clause-Patent
+
+**/
+
+#include <Library/BaseLib.h>
+#include <Library/BaseMemoryLib.h>
+#include <Library/DebugLib.h>
+#include <Library/Tpm2DeviceLib.h>
+#include <Library/PcdLib.h>
+#include <Library/VmgExitLib.h>
+
+#include "Tpm2DeviceLibDTpm.h"
+
+#pragma pack(1)
+typedef struct Tpm2SendCmdReq {
+	UINT32	Cmd;
+	UINT8	Locality;
+	UINT32	BufSize;
+	UINT8	Buf[];
+} Tpm2SendCmdReq;
+typedef struct Tpm2SendCmdResp {
+	INT32	Size;
+	UINT8	Buf[];
+} Tpm2SendCmdResp;
+#pragma pack()
+
+/* These defines come from the TPM platform interface */
+#define TPM_SEND_COMMAND		8
+#define TPM_PLATFORM_MAX_BUFFER		4096 /* max req/resp buffer size */
+
+STATIC UINT8 Tpm2SvsmBuffer[TPM_PLATFORM_MAX_BUFFER];
+
+/**
+  Send a command to TPM for execution and return response data.
+
+  @param[in]      BufferIn      Buffer for command data.
+  @param[in]      SizeIn        Size of command data.
+  @param[in, out] BufferOut     Buffer for response data.
+  @param[in, out] SizeOut       Size of response data.
+
+  @retval EFI_SUCCESS           Operation completed successfully.
+  @retval EFI_BUFFER_TOO_SMALL  Response data buffer is too small.
+  @retval EFI_DEVICE_ERROR      Unexpected device behavior.
+  @retval EFI_UNSUPPORTED       Unsupported TPM version
+
+**/
+EFI_STATUS
+Tpm2SvsmTpmCommand (
+  IN     UINT8                 *BufferIn,
+  IN     UINT32                SizeIn,
+  IN OUT UINT8                 *BufferOut,
+  IN OUT UINT32                *SizeOut
+  )
+{
+  Tpm2SendCmdReq  *req  = (Tpm2SendCmdReq *)Tpm2SvsmBuffer;
+  Tpm2SendCmdResp *resp = (Tpm2SendCmdResp *)Tpm2SvsmBuffer;
+
+  if (SizeIn > sizeof (Tpm2SvsmBuffer) - sizeof (*req)) {
+    return EFI_BUFFER_TOO_SMALL;
+  }
+
+  req->Cmd = TPM_SEND_COMMAND;
+  req->Locality = 0;
+  req->BufSize = SizeIn;
+  CopyMem (req->Buf, BufferIn, SizeIn);
+  if (!VmgExitVTPM (Tpm2SvsmBuffer)) {
+    return EFI_DEVICE_ERROR;
+  }
+
+  *SizeOut = resp->Size;
+  CopyMem (BufferOut, resp->Buf, *SizeOut);
+
+  return EFI_SUCCESS;
+}
+
+/**
+  Check if an SVSM based TPM is present
+
+  @retval TRUE    SVSM TPM is present
+  @retval FALSE   no SVSM TPM is present
+**/
+BOOLEAN
+Tpm2IsSvsm (
+  VOID
+  )
+{
+  BOOLEAN ret;
+  ret = VmgExitVTPM(NULL);
+  DEBUG((DEBUG_INFO, "Tpm2IsSvsm return %d\n", ret));
+  return ret;
+}
diff --git a/UefiCpuPkg/Library/VmgExitLibNull/VmgExitLibNull.c b/UefiCpuPkg/Library/VmgExitLibNull/VmgExitLibNull.c
index 02d72adab2b2..fd2b332980d9 100644
--- a/UefiCpuPkg/Library/VmgExitLibNull/VmgExitLibNull.c
+++ b/UefiCpuPkg/Library/VmgExitLibNull/VmgExitLibNull.c
@@ -246,3 +246,26 @@ VmgExitVmsaRmpAdjust (
 {
   return EFI_UNSUPPORTED;
 }
+
+/**
+  Tries to perform a SVSM call to the vTPM.
+
+  The buffer should contain a marshalled TPM command and will return a
+  marshalled TPM response.  Sending down a NULL buffer will do nothing but
+  can be used to probe for the existence of the SVSM vTPM (will return
+  non zero if no vTPM is present)
+
+  @param Buffer               A pointer to the input command and output response
+
+  @retval TRUE                The Command is processed (or the vTPM is present)
+  @retval FALSE               The vTPM is not present
+
+**/
+BOOLEAN
+EFIAPI
+VmgExitVTPM (
+  IN OUT UINT8             *Buffer
+  )
+{
+  return FALSE;
+}
-- 
2.35.3


