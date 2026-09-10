Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB57A3DB96F
	for <linux-coco@lists.linux.dev>; Thu, 10 Sep 2026 21:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789074411; cv=none; b=RMSW/WAu2AwzdTqMQxEmHvshjXLXzVK7k1nHHzTDPsj9dbpPzoakzIpfBrFSYv0rRX4Bs3WIiWd1ZYRlSoz9IuYLFCKg4h0M0qLcyAS8329p9xL40/XJgx0gLDtWG3myELzNQz6vEjQ/uMbzkeHwKpMTHsDSVt+Xpi8dj5aVlQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789074411; c=relaxed/simple;
	bh=+QJuiFNNU2WuMiOfbuoDhSNfC8EPo0OvHi6oF2IXUBk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=iN3yCB9fThdG3Cyou8lbjlSyrxZmbG1GIb1mtnlU8w3xqMrFU0rinYBc9pKKbfsWqJYDkw59gx0PPKzU7Eb3KTJ26S2ORycaohUD8dMyinHpN9Pugkiv1mL4p8uihSWg/XP6Nvked361qdmlZ+5H5eE25GxnPvf34G1sX3Z/WyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackyli.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=etMOHp3l; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackyli.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="etMOHp3l"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfa4e4684bso2812345ad.2
        for <linux-coco@lists.linux.dev>; Thu, 10 Sep 2026 14:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789074403; x=1789679203; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gNFeNcyltUj1f0y6EIQIHeGiYuc25QrluAzkIS54884=;
        b=etMOHp3l0gWV1+bo4hP33/uG/1yjUn0+WyVk9N4Z4brmNdod9kAjwYo1h+8FPonxNu
         1sH2gjp0IyR5wMSjQanA4pXrplnG56nYdR9mgVMxRFuzfoG9UGGrvZMGhxbEoJkjxYO5
         6fv7PVNg43DacKMnObZGyWFmSkS8KAAt/Ff9eQGdTVj+nHxoixQcoqCXz44VxpNGaBR5
         L9gE1FUULRPIR2gW49ERTjOvxAYljfOrqGUFw+5gnfpf/ILpXaGHF6DC4rOSRS11e1pB
         UtA0lzfHqnta3Aeli1dQAIhFczFb80ix61S8jI4JaTZ/NdGOqtfyQ0bzVp8+XPM/jawq
         lrxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789074403; x=1789679203;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gNFeNcyltUj1f0y6EIQIHeGiYuc25QrluAzkIS54884=;
        b=PWAX8ZU31DRv2qvBMf3HjVDPVNkue3HI3Ns6iB1EWX2sSWWbmrU1O36FlnbkkCNpfV
         Nx+o0GdPqkkQLQx/NU6Kbvvh9+XANaXPUT+mungfm1DHDHHd2P9rFVDC1UadQpQgM8rJ
         uweawTdNk0QnTHfXGUmi1EIlRfomIw6ObWx6NMSPfIpyPPobAwtyXmN/W+8DcMOra02B
         pf74uVdp06grKTapNIYJGOQl0gGFX7QmvytW8KefFmlJaC5Br1sRI1mcNHes7c6DTQt5
         7LGzCLNkeZ68oAxm1ZqHlrmJEEZcDe+cskDn3j5Bxu0Og1mxDHNSAok+SLBiWTkVH2Ak
         AoNA==
X-Forwarded-Encrypted: i=1; AKwUvBxhRSxnGW+EeFt52hS50UjDBATI6qtnRIHFFCAnsMNwYpmBmuoVzv61lnUv75sNhQogOnfPKjb/mexD@lists.linux.dev
X-Gm-Message-State: AFuF++lx2QE5VL8rGkTOWK1qfec4b8euioya60/euMNPhc3xLVm0iUdm
	WWJJ53SFbLMCqc6Aky8FSKNAuP548gGOmOt4wmYz8aHbNi5UMu/V1nREzPL4X3dGO3D4rCyXS/y
	hJaZw8r5f
X-Received: from pleg20.prod.google.com ([2002:a17:902:e394:b0:2db:814a:e864])
 (user=jackyli job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ea03:b0:2d9:1dee:43db
 with SMTP id d9443c01a7336-2dd2a34fd9cmr23427655ad.15.1789074402904; Thu, 10
 Sep 2026 14:06:42 -0700 (PDT)
Date: Thu, 10 Sep 2026 21:06:21 +0000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMwbo2oC/x2MSwqAIBQArxJvnaBR9rlKtNB81oMw0ZJAunvSa
 pjFTIaIgTDCVGUImCjS6YqIuoJ1V25DRqY4NLyRfBScRecZuaQOMoX+vlhntJaq5QP2FkrnA1p 6/ue8vO8HL8zzAGMAAAA=
X-Change-Id: 20260910-snp-invalid-input-5dbb6a408e7f
X-Mailer: b4 0.14.3
Message-ID: <20260910-snp-invalid-input-v1-1-fb2e03da614b@google.com>
Subject: [PATCH] KVM: SEV: Return INVALID_INPUT on SNP req/resp buffer access failure
From: Jacky Li <jackyli@google.com>
To: kvm@vger.kernel.org
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Michael Roth <michael.roth@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Jacob Xu <jacobhxu@google.com>, 
	Supraja Sridhara <suprajasri@google.com>, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Jacky Li <jackyli@google.com>
Content-Type: text/plain; charset="utf-8"

Currently, snp_handle_(ext_)guest_req() returns -EIO when
kvm_{read/write/clear}_guest() fails while accessing guest-provided
buffers. Returning -EIO causes KVM_RUN to exit to userspace, likely
killing the VM.

Fix this by returning GHCB_HV_RESP_MALFORMED_INPUT with sub-error code
GHCB_ERR_INVALID_INPUT to the guest and resuming the vCPU.

Per the GHCB specification, guest-provided GPA buffers that cannot
be accessed by the hypervisor (e.g. private pages) should be treated
as guest input errors. Because kvm_{read/write/clear}_guest() only
returns -EFAULT on failure, treating this failure as an invalid input
aligns with the definition of -EFAULT ("Bad address").

Returning GHCB_ERR_INVALID_INPUT also matches existing SNP handling
in KVM, which already returns this error code for unaligned or
overlapping buffers. It also aligns with other hypercall implementations
in KVM (e.g. Hyper-V returning INVALID_HYPERCALL_INPUT on
kvm_read_guest() failures in kvm_hv_flush_tlb()).

Performing upfront validation (e.g. via kvm_mem_is_private()) is
avoided because it is prone to TOCTOU races with concurrent Page State
Changes.

Fixes: 88caf544c930 ("KVM: SEV: Provide support for SNP_GUEST_REQUEST NAE event")
Fixes: 74458e4859d8 ("KVM: SEV: Provide support for SNP_EXTENDED_GUEST_REQUEST NAE event")
Signed-off-by: Jacky Li <jackyli@google.com>
---
 arch/x86/kvm/svm/sev.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 5705723f1f41..d07562310519 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -4228,8 +4228,10 @@ static int snp_handle_guest_req(struct vcpu_svm *svm, gpa_t req_gpa, gpa_t resp_
 
 	guard(mutex)(&sev->guest_req_mutex);
 
-	if (kvm_read_guest(kvm, req_gpa, sev->guest_req_buf, PAGE_SIZE))
-		return -EIO;
+	if (kvm_read_guest(kvm, req_gpa, sev->guest_req_buf, PAGE_SIZE)) {
+		svm_vmgexit_bad_input(svm, GHCB_ERR_INVALID_INPUT);
+		return 1;
+	}
 
 	data.gctx_paddr = __psp_pa(sev->snp_context);
 	data.req_paddr = __psp_pa(sev->guest_req_buf);
@@ -4244,8 +4246,10 @@ static int snp_handle_guest_req(struct vcpu_svm *svm, gpa_t req_gpa, gpa_t resp_
 	if (ret && !fw_err)
 		return ret;
 
-	if (kvm_write_guest(kvm, resp_gpa, sev->guest_resp_buf, PAGE_SIZE))
-		return -EIO;
+	if (kvm_write_guest(kvm, resp_gpa, sev->guest_resp_buf, PAGE_SIZE)) {
+		svm_vmgexit_bad_input(svm, GHCB_ERR_INVALID_INPUT);
+		return 1;
+	}
 
 	/* No action is requested *from KVM* if there was a firmware error. */
 	svm_vmgexit_no_action(svm, SNP_GUEST_ERR(0, fw_err));
@@ -4296,7 +4300,7 @@ static int snp_handle_ext_guest_req(struct vcpu_svm *svm, gpa_t req_gpa, gpa_t r
 
 	if (kvm_read_guest(kvm, req_gpa + offsetof(struct snp_guest_msg_hdr, msg_type),
 			   &msg_type, 1))
-		return -EIO;
+		goto request_invalid;
 
 	/*
 	 * As per GHCB spec, requests of type MSG_REPORT_REQ also allow for
@@ -4336,7 +4340,7 @@ static int snp_handle_ext_guest_req(struct vcpu_svm *svm, gpa_t req_gpa, gpa_t r
 		 * certificate table is terminated by 24-bytes of zeroes.
 		 */
 		if (data_npages && kvm_clear_guest(kvm, data_gpa, 24))
-			return -EIO;
+			goto request_invalid;
 	}
 
 	return snp_handle_guest_req(svm, req_gpa, resp_gpa);

---
base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
change-id: 20260910-snp-invalid-input-5dbb6a408e7f

Best regards,
-- 
Jacky Li <jackyli@google.com>

