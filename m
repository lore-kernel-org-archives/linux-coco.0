Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177AD28D830
	for <linux-coco@lists.linux.dev>; Thu, 15 May 2025 22:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747346660; cv=none; b=ubV4+26pEeiFTFW9Nkj13WNK17Fr9nAQ9vP5wdEWU5nbjuLQSYi/VdxF9RdcudU6PTMAbVli7ORuH+Zr6utJuEVwtUlMb+0a4YN9yuafNRl8g6mtuJft68hgHINJcUU8Y/kY8+JAAz+67BfYqFXkJRutdapN3GfCeP9cKz0UP48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747346660; c=relaxed/simple;
	bh=mmLKrWU9BMWCBbc2PskOjz9u++A6Zg7rZw9yObFxywE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ddK8RX3sxi4zF9k6MEP+NjJOw7bI6fx6sqavp91Y6ki3huuAFxDfUWq/HMnZwLzMJIKRtNBIVAUQO/DHdVcYkG6BkOofjnJZ2C4wpmrOhj8KiHtYCHLEue5IhiNX09IuWwxggxRwI1I7LCu9pNSF/Paj/XW8jPfh0V3KjSY1EMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dionnaglaze.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gNejrgxb; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dionnaglaze.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gNejrgxb"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-22fb8cfff31so11350535ad.1
        for <linux-coco@lists.linux.dev>; Thu, 15 May 2025 15:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747346658; x=1747951458; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=da2OQuvEUljiX7sOqbLfJ1kNKJczIhzC2yFs3FB784s=;
        b=gNejrgxbqNGrlcjbsUD4rRe3hvj19yXbS9FgCu7/gF6VnOSxPfZyiSoCBKiWUZ/yns
         4QVG5rkQW5WgS6WVvBE0Se9w/o3enfoFjQVOPQbWKMf3qWjqgZCsQ5PkvifPKhG5tlAy
         nyJ5It0mQg0yDuwSxb574o9N8RponTbjVgTdtGcTIzKJeCntFzuv/vgJXO3F2dy57r0t
         eisNAFIXNKseAJJjTwO/TIVPsOb+1ZSj0U03RnmaPIw6RklTp3VD2HE2lkQweqNqDey/
         0L2Ae7XBwanXwcEZ8XS2BSuviUmv7hZ6X1Sxd0EnW+MOatBhL1kOrfmN3xm6AcvGOpAo
         VZDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747346658; x=1747951458;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=da2OQuvEUljiX7sOqbLfJ1kNKJczIhzC2yFs3FB784s=;
        b=whbtQyFGNApgpRXONNrfI2c9LprMu/hBt1/BCR8Z3Au5Shm/llblZU9+0Ho3SOBUTt
         cO29lIdRRWoKFCFyH9Z8sHzTl1m+3haZMZlwqkb/4gWQDjbRPFEmWvENQ1el839nSptZ
         p5JfUJ1vnPpBA2lUP9RWfE0BbKGh9QKXEx0/Q0ccGs7zSxhueYvVf5SKftX64ktvNr/M
         Ci1M3qdCKZBCfzcqZBwsOoRuDsJf9woLyPRWZXtC9dAZHsoz87rOEWcj2tsH4fcR9cd6
         wZP6ljzdTMGIBbzstGHkYgBPqWSS9jkdrUTS2ADNJ5RrkYVEBYGYo+xv3ao0Bsncrx8O
         5eaA==
X-Forwarded-Encrypted: i=1; AJvYcCU7PdF9skceaqjKNQY0vIHzgVoBugvWuBCZic8G1Q22f3VVZdzAjNZ5ypNyIgO72R3Uit8QRF3Cv2rG@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9MAcQLekpJZfODYqVICsjeV43k8O1DeROmWooZnDrdy6IY3Z0
	b73RtM3hZdf2EuOjW/xxsIFcUmN9ITQvcze3NOnw1vMq5mrOU6am7skLzucYVAAUUvYEAC7F+Cu
	cl/JW/JbmmFWYjJTa2GICwq+x5Q==
X-Google-Smtp-Source: AGHT+IGlf26I+aKQ0s1+qKRvgDiVtukbmuiTudxffeFLhCnrwEABrd4/+TM3/By71fTsSsPwRSUcRT9wY+f7sv5Vlw==
X-Received: from plge2.prod.google.com ([2002:a17:902:cf42:b0:231:c831:9520])
 (user=dionnaglaze job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e787:b0:224:26fd:82e5 with SMTP id d9443c01a7336-231d455d9ddmr12636465ad.48.1747346658529;
 Thu, 15 May 2025 15:04:18 -0700 (PDT)
Date: Thu, 15 May 2025 22:04:00 +0000
In-Reply-To: <20250515220400.1096945-1-dionnaglaze@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250515220400.1096945-1-dionnaglaze@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250515220400.1096945-3-dionnaglaze@google.com>
Subject: [PATCH v5 2/2] kvm: sev: If ccp is busy, report busy to guest
From: Dionna Glaze <dionnaglaze@google.com>
To: kvm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	Dionna Glaze <dionnaglaze@google.com>, Thomas Lendacky <Thomas.Lendacky@amd.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Joerg Roedel <jroedel@suse.de>, Peter Gonda <pgonda@google.com>, 
	Borislav Petkov <bp@alien8.de>, Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"

The ccp driver can be overloaded even with guest request rate limits.
The return value of -EBUSY means that there is no firmware error to
report back to user space, so the guest VM would see this as
exitinfo2 = 0. The false success can trick the guest to update its
message sequence number when it shouldn't have.

Instead, when ccp returns -EBUSY, that is reported to userspace as the
throttling return value.

Cc: Thomas Lendacky <Thomas.Lendacky@amd.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Joerg Roedel <jroedel@suse.de>
Cc: Peter Gonda <pgonda@google.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Sean Christopherson <seanjc@google.com>

Signed-off-by: Dionna Glaze <dionnaglaze@google.com>
---
 arch/x86/kvm/svm/sev.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 35b04a10ed73..884ab3f54fca 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -4063,6 +4063,11 @@ static int snp_handle_guest_req(struct vcpu_svm *svm, gpa_t req_gpa, gpa_t resp_
 	 * the PSP is dead and commands are timing out.
 	 */
 	ret = sev_issue_cmd(kvm, SEV_CMD_SNP_GUEST_REQUEST, &data, &fw_err);
+	if (ret == -EBUSY) {
+		svm_vmgexit_no_action(svm, SNP_GUEST_ERR(SNP_GUEST_VMM_ERR_BUSY, fw_err));
+		ret = 1;
+		goto out_unlock;
+	}
 	if (ret && !fw_err)
 		goto out_unlock;
 
-- 
2.49.0.1101.gccaa498523-goog

