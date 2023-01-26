Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F82933F0
	for <linux-coco@lists.linux.dev>; Thu, 26 Jan 2023 22:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674772207; x=1706308207;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rmzyTS5XZ0XqYXZKrB6pH9OGLqztcBEU8YSeAM+eVWM=;
  b=fOCIRqWRZaJ/m/6CHh/a3zCpEprbLIl8/dtH26hOq/fQ29ljsjDw54aO
   3/Uj/Vk5X9v16IVTp2c49Fn5eTDl/KTmvWNJcoSoDJ1bayW68s1D16zD/
   LKiLaGgO2z/VZkvFh0IcESdaD+G78wci14wVMtN33cIbBwPcQwoE5H/40
   fNmQ0JcbfCwiOqs9t6ja2x5krQB990pJLAh2xvtZPI00azus5anI5ZUoz
   glELAxVmug/klabDV4OOUdbr8oU1om3xYSwp0rGGkg8aBPOndlEWGZnEy
   LZNabejH3omxGXQ+PN3OUz8GhZTwUBkKIWQz3/cbzbdWIoqxhxwwHJJVg
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="389342111"
X-IronPort-AV: E=Sophos;i="5.97,249,1669104000"; 
   d="scan'208";a="389342111"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2023 14:12:13 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="751770957"
X-IronPort-AV: E=Sophos;i="5.97,249,1669104000"; 
   d="scan'208";a="751770957"
Received: from smadjatx-mobl1.ger.corp.intel.com (HELO box.shutemov.name) ([10.251.210.179])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2023 14:12:11 -0800
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 8402A10DCB6; Fri, 27 Jan 2023 01:12:03 +0300 (+03)
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Dave Hansen <dave.hansen@intel.com>,
	Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Elena Reshetova <elena.reshetova@intel.com>,
	x86@kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [PATCHv2, RESEND 7/7] x86/tdx: Disable NOTIFY_ENABLES
Date: Fri, 27 Jan 2023 01:11:59 +0300
Message-Id: <20230126221159.8635-8-kirill.shutemov@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126221159.8635-1-kirill.shutemov@linux.intel.com>
References: <20230126221159.8635-1-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

== Background ==

There is a class of side-channel attacks against SGX enclaves called
"SGX Step"[1]. These attacks create lots of exceptions inside of
enclaves. Basically, run an in-enclave instruction, cause an exception.
Over and over.

There is a concern that a VMM could attack a TDX guest in the same way
by causing lots of #VE's. The TDX architecture includes new
countermeasures for these attacks. It basically counts the number of
exceptions and can send another *special* exception once the number of
VMM-induced #VE's hits a critical threshold[2].

== Problem ==

But, these special exceptions are independent of any action that the
guest takes. They can occur anywhere that the guest executes. This
includes sensitive areas like the entry code. The (non-paranoid) #VE
handler is incapable of handling exceptions in these areas.

== Solution ==

Fortunately, the special exceptions can be disabled by the guest via
write to NOTIFY_ENABLES TDCS field. NOTIFY_ENABLES is disabled by
default, but might be enabled by a bootloader, firmware or an earlier
kernel before the current kernel runs.

Disable NOTIFY_ENABLES feature explicitly and unconditionally. Any
NOTIFY_ENABLES-based #VE's that occur before this point will end up
in the early #VE exception handler and die due to unexpected exit
reason.

[1] https://github.com/jovanbulck/sgx-step
[2] https://intel.github.io/ccc-linux-guest-hardening-docs/security-spec.html#safety-against-ve-in-kernel-code

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Reviewed-by: Dave Hansen <dave.hansen@intel.com>
---
 arch/x86/coco/tdx/tdx.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index 2f4fbb7cd990..d72176a7d3a0 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -19,6 +19,10 @@
 #define TDX_GET_VEINFO			3
 #define TDX_GET_REPORT			4
 #define TDX_ACCEPT_PAGE			6
+#define TDX_WR				8
+
+/* TDCS fields. To be used by TDG.VM.WR and TDG.VM.RD module calls */
+#define TDCS_NOTIFY_ENABLES		0x9100000000000010
 
 /* TDX hypercall Leaf IDs */
 #define TDVMCALL_MAP_GPA		0x10001
@@ -863,6 +867,9 @@ void __init tdx_early_init(void)
 	tdx_parse_tdinfo(&cc_mask);
 	cc_set_mask(cc_mask);
 
+	/* Kernel does not use NOTIFY_ENABLES and does not need random #VEs */
+	tdx_module_call(TDX_WR, 0, TDCS_NOTIFY_ENABLES, 0, -1ULL, NULL);
+
 	/*
 	 * All bits above GPA width are reserved and kernel treats shared bit
 	 * as flag, not as part of physical address.
-- 
2.39.1

