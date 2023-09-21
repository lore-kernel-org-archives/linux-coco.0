Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1772418B00
	for <linux-coco@lists.linux.dev>; Thu, 21 Sep 2023 20:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695327290; x=1726863290;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LrS431o0cshlDoRy46oclShFvKK7oFAV7dBwoRHaY3I=;
  b=iyGorwnXy2aIljlKltKLJXXAEtiAOqKDFLv5gKq7azVAyGM8NNSsu6Zl
   I03vynCWaoUnxWwCE05+DClX4HSVXGBxOoSRpg7vYGyEDe4zfn//dUkke
   6RLJeSu8d0/ZdX674n7YMnHfAsiMe5bxFLTcppQvr6m8Riw+K3il/GgIe
   uQh/QtNs/t4tYjQd6sl/enZq772KyJO9YmNbUHPexOCF2jaf00q6qZz3O
   6xFOd0CNJm+ARd91Md1OlzYXs3Leq3CMxBR21HWyt6Gx2cRmrbkFXIBVx
   kV7rbFCDFAF11rw+ehmEuPTDor1MMvVRg1BQ5bdQPCK3VoHH+UAd10+b3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="383401643"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; 
   d="scan'208";a="383401643"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 13:14:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="696897807"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; 
   d="scan'208";a="696897807"
Received: from ls.sc.intel.com (HELO localhost) ([172.25.112.31])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 13:14:48 -0700
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
Subject: [RFC PATCH v2 4/6] KVM: gmem: Add ioctl to inject memory failure on guest memfd
Date: Thu, 21 Sep 2023 13:14:37 -0700
Message-Id: <363c4ac28af93aa96a52f897d2fe5c7ec013f746.1695327124.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1695327124.git.isaku.yamahata@intel.com>
References: <cover.1695327124.git.isaku.yamahata@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Isaku Yamahata <isaku.yamahata@intel.com>

To test error_remove_page() method of KVM gmem, add a new ioctl to
inject memory failure based on offset of guest memfd.

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 include/uapi/linux/kvm.h |  6 ++++
 virt/kvm/guest_mem.c     | 68 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 74 insertions(+)

diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 65fc983af840..4160614bcc0f 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -2323,4 +2323,10 @@ struct kvm_create_guest_memfd {
 	__u64 reserved[6];
 };
 
+#define KVM_GUEST_MEMORY_FAILURE	_IOWR(KVMIO,  0xd5, struct kvm_guest_memory_failure)
+
+struct kvm_guest_memory_failure {
+	__u64 offset;
+};
+
 #endif /* __LINUX_KVM_H */
diff --git a/virt/kvm/guest_mem.c b/virt/kvm/guest_mem.c
index 01fb4ca861d0..bc9dae50004b 100644
--- a/virt/kvm/guest_mem.c
+++ b/virt/kvm/guest_mem.c
@@ -291,10 +291,78 @@ static struct file *kvm_gmem_get_file(struct kvm_memory_slot *slot)
 	return file;
 }
 
+static int kvm_gmem_inject_failure(struct file *file,
+				   struct kvm_guest_memory_failure *mf)
+{
+	struct inode *inode = file_inode(file);
+	struct address_space *mapping = inode->i_mapping;
+	pgoff_t index = mf->offset >> PAGE_SHIFT;
+	struct folio *folio;
+	unsigned long pfn;
+	int err = 0;
+
+	if (!capable(CAP_SYS_ADMIN))
+		return -EPERM;
+
+	filemap_invalidate_lock_shared(mapping);
+
+	/* Don't allocate page. */
+	folio = filemap_get_folio(mapping, index);
+	if (!folio) {
+		err = -ENOENT;
+		goto out;
+	}
+	if (IS_ERR(folio)) {
+		err = PTR_ERR(folio);
+		goto out;
+	}
+
+	pfn = folio_pfn(folio) + (index - folio_index(folio));
+	folio_put(folio);
+
+out:
+	filemap_invalidate_unlock_shared(mapping);
+	if (err)
+		return err;
+
+	/*
+	 * Race with pfn: memory_failure() and unpoison_memory() gain invalidate
+	 * lock as the error recovery logic tries to remove pages from
+	 * mapping.
+	 */
+	if (!pfn_valid(pfn))
+		return -ENXIO;
+	return memory_failure(pfn, MF_SW_SIMULATED);
+}
+
+static long kvm_gmem_ioctl(struct file *file, unsigned int ioctl,
+			   unsigned long arg)
+{
+	void __user *argp = (void __user *)arg;
+	int r = -EINVAL;
+
+	switch (ioctl) {
+	case KVM_GUEST_MEMORY_FAILURE: {
+		struct kvm_guest_memory_failure mf;
+
+		r = -EFAULT;
+		if (copy_from_user(&mf, argp, sizeof(mf)))
+			break;
+		r = kvm_gmem_inject_failure(file, &mf);
+		break;
+	}
+	default:
+		break;
+	}
+
+	return r;
+}
+
 static const struct file_operations kvm_gmem_fops = {
 	.open		= generic_file_open,
 	.release	= kvm_gmem_release,
 	.fallocate	= kvm_gmem_fallocate,
+	.unlocked_ioctl	= kvm_gmem_ioctl,
 };
 
 static int kvm_gmem_migrate_folio(struct address_space *mapping,
-- 
2.25.1

