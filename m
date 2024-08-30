Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426BE165F05
	for <linux-coco@lists.linux.dev>; Fri, 30 Aug 2024 13:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725022932; cv=none; b=KBs6BSyDV6fXU7RYDtHSarILrry4EBd+RrU64tjl4V/GZATVOckGaiU8XM08Gb5C5kwKT7+i6qPl/rZBPwEyhzKEvUuhbdqiAT7Um97CDpRvJkQtbKmfUN+HKAzUw1k/ODBoANWq1UVy9ucy+/jBwDST7hBLMPSyKaim11GpB1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725022932; c=relaxed/simple;
	bh=4oBR8c+ruWWR4yY4NkYeiQvCpzhVOo7g+22tEvJu/4Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fc2veZnfSISp+ydeClUEwJVmw+J88WvJwN2iSmM4X2XThmpCusGT5t+2lu6T1L4OaJLJuxaHBuxhPtfmKYdFW5CJqr87xRiPIZwxT3sIEreXmarldGU+wVcrUJE8UYdnErQr+OYB+YjawrVTyuD6lUsM8tW5Cc7ev9qWw96VNdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gfzzXc8r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gfzzXc8r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC7D6C4CEC8;
	Fri, 30 Aug 2024 13:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725022931;
	bh=4oBR8c+ruWWR4yY4NkYeiQvCpzhVOo7g+22tEvJu/4Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gfzzXc8rNX0G/ZIVOuxaYb9ElY6ZkexXO6W/gNczbDphzHHV7hv+S98pGyHhuJDEJ
	 frkeV/djkSs6k+S95hEl/J22fXutuiSxCus5HyknSe0vXfAiaxAegkE0zzjKK4R/Jm
	 B64JFHD1+ZQ3iC170sINgrkREeWadQ/j2cTVUJP+t3vj08YHgV7EigGfxy+y6BgtKP
	 btm7JXlV3ujvTo+DA6MHL/cA2TNqIiFwh0DOwzduNZNgLk8FyjIxYQvvoCmuJ3IDuu
	 yqtv1Yd5l5FEagvZNQAqAiH9blDw974fhlWuygOoh7ErOe+jOi+P+aLCYDn98gdhz8
	 5zP28Nr8irPrw==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Will Deacon <will@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Marc Zyngier <maz@kernel.org>,
	linux-coco@lists.linux.dev
Subject: [PATCH v2 7/7] arm64: smccc: Reserve block of KVM "vendor" services for pKVM hypercalls
Date: Fri, 30 Aug 2024 14:01:50 +0100
Message-Id: <20240830130150.8568-8-will@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20240830130150.8568-1-will@kernel.org>
References: <20240830130150.8568-1-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pKVM relies on hypercalls to expose services such as memory sharing to
protected guests. Tentatively allocate a block of 58 hypercalls (i.e.
fill the remaining space in the first 64 function IDs) for pKVM usage,
as future extensions such as pvIOMMU support, range-based memory sharing
and validation of assigned devices will require additional services.

Suggested-by: Marc Zyngier <maz@kernel.org>
Link: https://lore.kernel.org/r/86a5h5yg5y.wl-maz@kernel.org
Signed-off-by: Will Deacon <will@kernel.org>
---
 include/linux/arm-smccc.h | 60 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
index e93c1f7cea70..f59099a213d0 100644
--- a/include/linux/arm-smccc.h
+++ b/include/linux/arm-smccc.h
@@ -115,10 +115,70 @@
 /* KVM "vendor specific" services */
 #define ARM_SMCCC_KVM_FUNC_FEATURES		0
 #define ARM_SMCCC_KVM_FUNC_PTP			1
+/* Start of pKVM hypercall range */
 #define ARM_SMCCC_KVM_FUNC_HYP_MEMINFO		2
 #define ARM_SMCCC_KVM_FUNC_MEM_SHARE		3
 #define ARM_SMCCC_KVM_FUNC_MEM_UNSHARE		4
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_5		5
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_6		6
 #define ARM_SMCCC_KVM_FUNC_MMIO_GUARD		7
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_8		8
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_9		9
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_10		10
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_11		11
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_12		12
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_13		13
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_14		14
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_15		15
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_16		16
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_17		17
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_18		18
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_19		19
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_20		20
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_21		21
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_22		22
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_23		23
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_24		24
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_25		25
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_26		26
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_27		27
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_28		28
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_29		29
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_30		30
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_31		31
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_32		32
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_33		33
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_34		34
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_35		35
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_36		36
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_37		37
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_38		38
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_39		39
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_40		40
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_41		41
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_42		42
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_43		43
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_44		44
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_45		45
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_46		46
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_47		47
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_48		48
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_49		49
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_50		50
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_51		51
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_52		52
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_53		53
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_54		54
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_55		55
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_56		56
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_57		57
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_58		58
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_59		59
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_60		60
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_61		61
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_62		62
+#define ARM_SMCCC_KVM_FUNC_PKVM_RESV_63		63
+/* End of pKVM hypercall range */
 #define ARM_SMCCC_KVM_FUNC_FEATURES_2		127
 #define ARM_SMCCC_KVM_NUM_FUNCS			128
 
-- 
2.46.0.469.g59c65b2a67-goog

