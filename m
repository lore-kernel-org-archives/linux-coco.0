Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AECD1E500
	for <linux-coco@lists.linux.dev>; Wed, 13 Sep 2023 10:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694602155; x=1726138155;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=l4rRB6q60nP3OBQRoA84gLJ739r9ruaKEWruVEincP8=;
  b=OC4DL6MzbFPH/mZ7l2PAsEgNnTWOm1vFBQkcqdGL/dDHYobDBz7Iy74j
   Sk37C4pUT4JW3c2BNkqTq1XINkcCZqLl85aMTEIDShgAGZpVDJx/pnTUU
   bWP2L5qJA3qO98363nV8CGq7lAQ7lHmn8p3bytZzMW4YNg8kJgkW1x67V
   5a+eXgW5OyIJM6uVIM+7MHVg5F44TRcJzSVL4qvfHCVLJBnVDLqHml7QH
   0RIUQfae2zQq10MAG+RgeRftVOrypLmpBBQX3L/zuvyaEulP4c4KBATKI
   4uOxL4mNoHgeHhbGQenc9J5Dl7mTOwCNunw60KXr0nKSMbFN8QztD2L0F
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="377537908"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="377537908"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 03:49:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="809635601"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="809635601"
Received: from ls.sc.intel.com (HELO localhost) ([172.25.112.31])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 03:49:12 -0700
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
	Yuan Yao <yuan.yao@linux.intel.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Xu Yilun <yilun.xu@intel.com>,
	Quentin Perret <qperret@google.com>,
	wei.w.wang@intel.com,
	Fuad Tabba <tabba@google.com>
Subject: [RFC PATCH 6/6] KVM: X86: Allow KVM gmem hwpoison test cases
Date: Wed, 13 Sep 2023 03:48:55 -0700
Message-Id: <192a749b3842619e89bf91513e3c2715091ced61.1694599703.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1694599703.git.isaku.yamahata@intel.com>
References: <cover.1694599703.git.isaku.yamahata@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Isaku Yamahata <isaku.yamahata@intel.com>

Set HAVE_GENERIC_PRIVATE_MEM_HANDLE_ERROR and KVM_GENERIC_PRIVATE_MEM_BMAP
to allow test cases for KVM gmem.

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 arch/x86/kvm/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
index 029c76bcd1a5..46fdedde9c0f 100644
--- a/arch/x86/kvm/Kconfig
+++ b/arch/x86/kvm/Kconfig
@@ -82,6 +82,8 @@ config KVM_SW_PROTECTED_VM
 	depends on EXPERT
 	depends on X86_64
 	select KVM_GENERIC_PRIVATE_MEM
+	select HAVE_GENERIC_PRIVATE_MEM_HANDLE_ERROR
+	select KVM_GENERIC_PRIVATE_MEM_BMAP
 	help
 	  Enable support for KVM software-protected VMs.  Currently "protected"
 	  means the VM can be backed with memory provided by
-- 
2.25.1

