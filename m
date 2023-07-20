Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B361E504
	for <linux-coco@lists.linux.dev>; Thu, 20 Jul 2023 23:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689895999; x=1721431999;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=54f6oGhMQOvzfr4uV0Pwhmi/Poh/uRJMyo79eGxiezU=;
  b=e+Zlnsu0+WyNpH+xQUupOrFVGaq5cm8xrKKEYqc2/RspN8gmKkhgvzmH
   ANGMXU5zclxbbn0idE4SANxZBs82n5D95TO2zbSBfqjVllQ2QMygTNwc2
   094eqmpMRX+K2zUssQPXMX2GCwdPQEyPkUA2ytCUstFK8HPVeNCvpefh8
   NT/BtRwybBmP/ORP2OSM2Bg163jh8LNEKuPV1rmry91t8YVoLtgkxE0J8
   C9HcjhjdK+96Gqug0B+5RpU6d4IeBPLQ9OePlIIsCjEUwLEp8gZDgqFMT
   z//sSe9UFfBSLSj6Hg2z4KCnmH90sfBrA1fTeyiLuWmydf+bmJjjoyMuG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="364355977"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="364355977"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 16:33:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="727891811"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="727891811"
Received: from ls.sc.intel.com (HELO localhost) ([172.25.112.31])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 16:33:13 -0700
From: isaku.yamahata@intel.com
To: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: isaku.yamahata@intel.com,
	isaku.yamahata@gmail.com,
	Michael Roth <michael.roth@amd.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	erdemaktas@google.com,
	Sagi Shahar <sagis@google.com>,
	David Matlack <dmatlack@google.com>,
	Kai Huang <kai.huang@intel.com>,
	Zhi Wang <zhi.wang.linux@gmail.com>,
	chen.bo@intel.com,
	linux-coco@lists.linux.dev,
	Chao Peng <chao.p.peng@linux.intel.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Vishal Annapurve <vannapurve@google.com>,
	Yuan Yao <yuan.yao@linux.intel.com>
Subject: [RFC PATCH v4 10/10] KVM: X86: KVM_MEM_ENC_OP check if unused field (flags, error) is zero
Date: Thu, 20 Jul 2023 16:32:56 -0700
Message-Id: <cf4e12dbe7d8d759ff87e088ade54bd710926d1e.1689893403.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1689893403.git.isaku.yamahata@intel.com>
References: <cover.1689893403.git.isaku.yamahata@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Isaku Yamahata <isaku.yamahata@intel.com>

This breaks uABI as the current code doesn't check padding and sev_fd
when unused.

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
Changes v3 -> v4:
- newly added
---
 arch/x86/kvm/x86.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index ab36e8940f1b..1d6085af6a00 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -7055,6 +7055,22 @@ int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
 			r = -EFAULT;
 			goto out;
 		}
+		/* No sub-command uses flags at the moment. */
+		if (cmd.flags) {
+			r = -EINVAL;
+			goto out;
+		}
+		if (cmd.id != KVM_SEV_LAUNCH_START &&
+		    cmd.id != KVM_SEV_RECEIVE_START && cmd.error64) {
+			r = -EINVAL;
+			goto out;
+		}
+		if ((cmd.id == KVM_SEV_LAUNCH_START ||
+		     cmd.id == KVM_SEV_RECEIVE_START) && cmd.error) {
+			r = -EINVAL;
+			goto out;
+		}
+
 		r = static_call(kvm_x86_mem_enc_ioctl)(kvm, &cmd);
 		if (copy_to_user(argp, &cmd, sizeof(cmd)))
 			r = -EFAULT;
-- 
2.25.1

