Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C2A83630BE
	for <linux-coco@lists.linux.dev>; Tue, 23 Jun 2026 09:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782206166; cv=none; b=UxSiXQ2ICgaqSzoHzurQ+EJw48NFrRqReVYOA2xaGqInaTrOZvroZUPZZY2AzpZ7us3rupk8H11JhXhLmyD1vdWEQMjRntIM38jQ7tJyh8wPFG5tchJU4FooPJCEVHcqpLhIWjyG3ucPC6p1gyc/THbTa79pPL13OOjXbUEG/FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782206166; c=relaxed/simple;
	bh=IHPxirW0tGSOOWb/OQLL9F3AfBhjt8ti3JHwfRUhur0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SNcJ2FPNExlb1Lqze8e/PhMUoOu9PsikzCOZcqDvbTAnqGEFHyvLo9YRzdUmzLd4UD2+q+/sPJ9g0lFUFGHIP1UvjVbGp346uASX1ozGVMaTzZZ3RydQ26U/qHisVc6zK+ZsRV0Arh1lNEoZ+vWhd3S7ULAdblSbxDiLgKvj4DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from io.fritz.box (p200300f6af4fc500cc95bb0c16cd4e45.dip0.t-ipconnect.de [IPv6:2003:f6:af4f:c500:cc95:bb0c:16cd:4e45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id D4DDA203CDD;
	Tue, 23 Jun 2026 11:16:02 +0200 (CEST)
From: =?UTF-8?q?J=C3=B6rg=20R=C3=B6del?= <joro@8bytes.org>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: x86@kernel.org,
	Kiryl Shutsemau <kas@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Ashish Kalra <ashish.kalra@amd.com>,
	Michael Roth <michael.roth@amd.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev,
	Joerg Roedel <joerg.roedel@amd.com>
Subject: [PATCH 0/4] kvm: sev: Fix issues reported by Sashiko
Date: Tue, 23 Jun 2026 11:15:52 +0200
Message-ID: <20260623091556.1500930-1-joro@8bytes.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joerg Roedel <joerg.roedel@amd.com>

Hi,

On the post of my direct-VMSA patch-set Sashiko reported a few real
pre-existing issues in the SEV-SNP launch_update code. This patch-set
addresses three of them:

	* Fix user-triggerable WARN_ON on LAUNCH_UPDATE path.

	* Check that CPUID pages are writable before writing error
	  information to it.

	* Fix kunmap_local() order.

Please review.

-Joerg

Joerg Roedel (4):
  kvm: sev: Fix user-space triggerable WARN_ON on snp_launch_update path
  kvm: sev: Unmap pages in correct order in sev_gmem_post_populate()
  KVM: guest_memfd: Add `write` parameter to kvm_gmem_populate()
  kvm: sev: Acquire a writeable page reference for CPUID pages

 arch/x86/kvm/svm/sev.c   | 15 +++++++++++++--
 arch/x86/kvm/vmx/tdx.c   |  2 +-
 include/linux/kvm_host.h |  4 +++-
 virt/kvm/guest_memfd.c   |  4 ++--
 4 files changed, 19 insertions(+), 6 deletions(-)

-- 
2.53.0

