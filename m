Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E0048A2BE
	for <linux-coco@lists.linux.dev>; Tue, 25 Aug 2026 17:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787680476; cv=none; b=By50ddhN8dXbsN/ca9qkH37mU0aqo6IWX9NDzHmuWDacoRpHXDJDneD8rS7BuUFQQxIulCpivSuSFdq4lo2TUb2WgYfScs1U0xZqZERMcC/5xmbR/y5zE0alq1J4QZtwYryv2RFhk1/SgCFEBR9o9YCtc8PU7BrhgaF7slC0YTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787680476; c=relaxed/simple;
	bh=KunFI4u3eP0mN2tR2vXuilYiFM0NZ8HdLfTaTjEW5IY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=c9cKJ7r6UGrJVeX8aRe987p45U1nidHRGlbsVnVSuAXZMv27F0lhs6UG0N0ngJM164B+AYAOAF/ddn3V3gz8eovS9XmeDeh02ePlSYTGEDnWjLpDpB1xFGSbRdbEKwwiyig945ReIzis3000kEU3f4AOxlYJuvmk9MhDkREgmYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--psalian.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bbAAt3rU; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--psalian.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bbAAt3rU"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc73f47bdcso1439035ad.3
        for <linux-coco@lists.linux.dev>; Tue, 25 Aug 2026 10:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787680474; x=1788285274; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N59DgKOPss+GkqdGuEiTBLRkcriWzSRmCcb9Y3QV98c=;
        b=bbAAt3rUc5Len2ZU3ZagrsHFh9MqknaLyCQ67/aIBWnB1K1XnfIa7vclHhFhqjUlsq
         gVBiVJjof1FAMNGbFt1l1SA5bYmiPerRx60kn+ipZXn0QIuG57n6hEB9gm5QKJA2YMVg
         8FSBtPgAlLgwL3LrI9Aog2Wayb3wGL61oXi+PdjGl0pPsrEI3sN+XbaXwsTUIRPGou9s
         OnXdMGhCyisDKmrSH5SA+iRfWgZ8/BHhW25P6gJhq0TKVxldmElYbgN+AKCKZ3CpwdMc
         uPmtgtoD7Djn30yNFmjDwQUS21NvLjydD9tdHUrgFdU2VgmPMOEjzpB6sC6vSSMBrczd
         bhfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787680474; x=1788285274;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N59DgKOPss+GkqdGuEiTBLRkcriWzSRmCcb9Y3QV98c=;
        b=aPElvRXszk4ec8msis/fMLYE4DDCtICEJNze+4KFVkoHuEcwgmoQMMjA1Ves/V2+jz
         nW11wDuauNqQbfzzMSDBTa2Q2gDDRtPWjU58b3LTzqk/N1M5jC0fB417095GMHsOWq6k
         eHs0dAZw1+xLlLu4L0v+6k9WLPxr6JcYHTmiOZQsjza0uwWj+9DOlK+6LjHcLTSTLxi3
         0QUOOb/Mn5YQicjg334ongpBwE5U3oT+2NHQSQv++kwgYNfBxkEDjyAgT66coR6IMeKB
         u8FCI62c++/FvNYAmn9v7QmFh8eRymqn97xZtEVSMv2QsbAXor7UkMVQLeI95n/6BLN8
         kMlA==
X-Forwarded-Encrypted: i=1; AHgh+RpkHEgHBel2ProIpEiSlTId/319FJKLKFG7wDNvxTzavKjkGozkw6qMsleYdZ8inAIZn7+15HanXNuj@lists.linux.dev
X-Gm-Message-State: AFuF++nrImA2sWdzZp2TRte8GtSJCEM9kOOtQ+FKzeCIjTIA+ICfSpjm
	RLDLtMuV7dm4HCqfvSH+YevsmlHirRvhJCADoRsfdWVCfmy9am9fmGnERGAjLZ8qmh6sN/baztW
	THazmrH4qgA==
X-Received: from plbjw24.prod.google.com ([2002:a17:903:2798:b0:2cc:8741:f340])
 (user=psalian job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:cf41:b0:2d0:401c:2ebb
 with SMTP id d9443c01a7336-2d7079df723mr271545ad.4.1787680474357; Tue, 25 Aug
 2026 10:54:34 -0700 (PDT)
Date: Tue, 25 Aug 2026 17:54:33 +0000
In-Reply-To: <20260727210718.125872-1-psalian@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260727210718.125872-1-psalian@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260825175433.2588528-1-psalian@google.com>
Subject: [PATCH v2] fuse: mark DAX VMA page protections as decrypted
From: Punit Salian <psalian@google.com>
To: miklos@szeredi.hu
Cc: pankaj.gupta@amd.com, michael.roth@amd.com, thomas.lendacky@amd.com, 
	stefanha@redhat.com, vgoyal@redhat.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, x86@kernel.org, 
	Punit Salian <psalian@google.com>
Content-Type: text/plain; charset="UTF-8"

In confidential computing guest environments (such as AMD SEV-SNP or
Intel TDX), direct memory access (DAX) mappings between the guest kernel
and host-backed FUSE/virtiofs shared memory regions must be accessed
using shared (decrypted) page protections.

Modify fuse_dax_mmap() to apply pgprot_decrypted() to vma->vm_page_prot
when establishing FUSE DAX memory mappings. This ensures guest page
table entries for shared DAX buffers are explicitly marked as decrypted,
preventing memory encryption faults when accessing host-shared DAX memory.

Signed-off-by: Punit Salian <psalian@google.com>
Acked-by: Pankaj Gupta <pankaj.gupta@amd.com>
---
v1 -> v2:
- Added Acked-by tag from Pankaj Gupta.
---
 fs/fuse/dax.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/fuse/dax.c b/fs/fuse/dax.c
index a15c464c8d19..00e316a7f805 100644
--- a/fs/fuse/dax.c
+++ b/fs/fuse/dax.c
@@ -826,6 +826,7 @@ int fuse_dax_mmap(struct file *file, struct vm_area_struct *vma)
 	file_accessed(file);
 	vma->vm_ops = &fuse_dax_vm_ops;
 	vm_flags_set(vma, VM_MIXEDMAP | VM_HUGEPAGE);
+	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
 
 	return 0;
 }
-- 
