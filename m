Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B444AF9F4
	for <linux-coco@lists.linux.dev>; Mon, 21 Sep 2026 17:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790012693; cv=none; b=Gaxk2WlS94reaMl14iPKmfxG8aRUqu14bw4w1ls0LhBrdcfENEysT1/Y3vugmjY3CDpZNFc7huaeZqZeEAm3/sK1IMrGd5m/CHqIHCZ+4+g30DwPsWQqY89U4lG8BAMPWYPnv+sE6bC3Bb/HJ+HvFh561eiyfIyVTSLVXVtbsRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790012693; c=relaxed/simple;
	bh=CNhibckm2761zC3hAPFvim0N4m7lGBRenE1P2zWSHJk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FWzW30eFTzLzoULfWSPY144IyoNCznaZB81Jxx6mmJCcwX9McNcA+1tHFoa3PRoTcUUSH0/LHhljBxLmjzFijQD7VDoCB8p02GErLhidLJvSTKJDFA36/MxrNmTicq+7M7VJ5XP2Mbs8TJRTa1RDJDOqlg0scpKqU/gQmyhtNKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o7fgOBLQ; arc=none smtp.client-ip=209.85.210.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o7fgOBLQ"
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-86ab8302b54so3701133b3a.1
        for <linux-coco@lists.linux.dev>; Mon, 21 Sep 2026 10:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790012691; x=1790617491; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=y4bAp3nBUO90ZQn1u2Z0gOxXpoxTWghtyWO5GBrBpXE=;
        b=o7fgOBLQUyRgIJJu8sUeQxQYj/byr6/fldZMDQi20zpkEZWH6Yfl+rllJJIA+4x0tP
         12KZCQEitNh+FsntvFy+YXVA/pHYdjRWha1izN82mQ+uS2Oxc/2wV/0qpr29sYD/lBsv
         Kn4n5rk+rWODTiIOdFaxGRK+ny0p1nlPsCfr8nkfIY43hQK8vB1at5Q/BsjKa/mEDSNy
         fDypuzpzKRWenAH3sgCNWqObjpH7pv8KpNlLKdlA3Q9qliDdSTKZlxPPuAKhQ/MKQ8pB
         mJhGsW0nIVB/5Skwdet2jJ89hlLouCUp/E1rceFegIpoDPJXGjwDsAdtHkmaiBSNBN75
         WvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790012691; x=1790617491;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y4bAp3nBUO90ZQn1u2Z0gOxXpoxTWghtyWO5GBrBpXE=;
        b=sYQ/CQ/2odCFr8vg1NMvz0WY91J6urxIs9Q9KWx0eSOPN32kcvUxNjVoCoeK0ttj43
         0y12bnYa+dHTDz7mXny769gwRjjD2X4YS7bJgfgKpLU5W8s3IgJ1rrPFF4p0g2SKM35p
         f0BzoIz6PT/kyGO7qPVDzMiF+Yn+Wrm/gTN001NRxeosUdGA9XZAXfucwH/K4jf1cmMf
         0xrNkk2OE4tIkWNYfZ8C3Zas/6OiyioX4gv9iK8FU2fxt0ofC9ro3C6zN4eygRLwK8g6
         sO+b1zVwZnd4ltWwrJjQbsh9v5LyG+8I8Oe2HDg7rZKQNEG4ttBwsrIH9kS163r3Yq8c
         W4bw==
X-Forwarded-Encrypted: i=1; AKwUvByPYCTxFoNIXp58RpbBgpBaEkmp307V4IDLpauWlOBDKh3T8a0T0OzktawPvuGuqF98tuXMLSqyn3+s@lists.linux.dev
X-Gm-Message-State: AFuF++kNkRZtu4AHmjQNnXlVOTyggNojW7cG93bQ6sfH1v+MTvh+H4vv
	FgXIwMfxIm7LBM/LSxpmVHv9XmcUDvUnGODSq+KDSe7oPlKVrenct1lo5r6NPx2Xmirg/8yUb89
	LwBr1ow==
X-Received: from pgvn10.prod.google.com ([2002:a65:63ca:0:b0:cc4:5907:21e9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:1b81:b0:3cd:8bba:824f
 with SMTP id adf61e73a8af0-3dd8c3d3acfmr19085095637.4.1790012690700; Mon, 21
 Sep 2026 10:44:50 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Mon, 21 Sep 2026 10:44:41 -0700
In-Reply-To: <20260921174445.911676-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260921174445.911676-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921174445.911676-4-seanjc@google.com>
Subject: [PATCH v2 3/7] KVM: RISC-V: Use kvm_is_vcpu_creation_in_progress()
 instead of open-coded equivalent
From: Sean Christopherson <seanjc@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, Atish Patra <atish.patra@linux.dev>, 
	Alexandre Ghiti <alex@ghiti.fr>, Dave Hansen <dave.hansen@linux.intel.com>, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	x86@kernel.org, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Jean-Christophe Guillain <jean-christophe@guillain.net>, 
	"=?UTF-8?q?Pawe=C5=82=20S?=" <spawel523@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Use kvm_is_vcpu_creation_in_progress() instead of an open-coded equivalent
during AIA initialization.  Unlike similar vGIC code in arm64, the relevant
RISC-V code runs under kvm->lock, i.e. can use the standard API without
hitting lockdep false positive.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/riscv/kvm/aia_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/aia_device.c b/arch/riscv/kvm/aia_device.c
index efc7c0bcfba9..97833a04268a 100644
--- a/arch/riscv/kvm/aia_device.c
+++ b/arch/riscv/kvm/aia_device.c
@@ -237,7 +237,7 @@ static int aia_init(struct kvm *kvm)
 		return -EBUSY;
 
 	/* We might be in the middle of creating a VCPU? */
-	if (kvm->created_vcpus != atomic_read(&kvm->online_vcpus))
+	if (kvm_is_vcpu_creation_in_progress(kvm))
 		return -EBUSY;
 
 	/* Number of sources should be less than or equals number of IDs */
-- 
2.55.0.1082.g2b9226bbc0-goog

