Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FD8185091
	for <linux-coco@lists.linux.dev>; Wed, 26 Jun 2024 14:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719411768; cv=none; b=fEgDOp2omWCxX71ACxDggIUm5qqhc6pDtgyqPAqSs/gHxLIS76bMk8fDCtoPzWC/zSjM8Ba2AVla6NthDaBYDqHyat8NS7XbP6QwhrUsZYqD70T4PbIAwLpNNxPw9Se69C3CXvYUHmTgTiZhiWVM3/84TdS01qiyrsw6MjI8JTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719411768; c=relaxed/simple;
	bh=Md2bQa4i77L1a2ZeCzjEInnWWb4LCcOfrCX9kdzNkqI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PxhdNKYqmFjP3zDId9YWKhzwiVrAIDwBJeCX3sFzivqJewWYAh4hnkhDeBQog/gC6i8eYxBLY3fjw8sV+uLzMnJsd+ECeEZjcP7d7C0um6jzfO9647B+6hI4m09rVbLQLgAeKqikAXzmnbFj5LVnLNvhYt2mu5ueqFJO0OHf3Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yyL79O7R; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yyL79O7R"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6479d38bdfaso36570887b3.0
        for <linux-coco@lists.linux.dev>; Wed, 26 Jun 2024 07:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719411765; x=1720016565; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qp7ZaRBbzBSgQ/146Ma/gHnUZhhaH0ckKss1Vo4y77o=;
        b=yyL79O7R4lPZ+XwjUpk82FXpLUrEEFmAnGTK0IYv8afdeqageWp7u72Qm7RLRTYl0e
         FifAEIBUHWIAafSW0Zv+bRruDuHUWoGvPwnEQrVYDqSMsSkpyE6WT5W0QPpKLYMPFGD/
         sSq5HeJRxm4vo/mTkH1d6eOnJpGBkujZRyHFE6GSyW8oNzeQgoR+zS2F47J1mma1fEIY
         mLZq35LZ3rnb8sWa+BWOrbRjbD6Wix9RaL8MvdLFBsc30EOuSr2VI7tZ8E/zlOvQ2UO2
         yeRyVSbjrWO50pDYNtTXrOENuYVyBY6K95EMQDixARZS86Pl3KnInIfnO487stcqVehz
         5XSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719411765; x=1720016565;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qp7ZaRBbzBSgQ/146Ma/gHnUZhhaH0ckKss1Vo4y77o=;
        b=C/wDtemTeVDj9x0+GmOwzYcrq8cXCH3NwsIditoOKZfP7v/rolUBBnAtLRjjqURYWf
         NGZAStI6baJ4Gu1frQOZ3cROyz53NDOt1Lj0ERY39mJIdb6hnZ3EMy0YDQbNorv9jjUu
         xJRVa1F4QkL1UxKK/sjdaHW4HzVWfsIQHzkp3g1HswA4MisECS+yuVNzHbBvQJtkHVZn
         7ud9+cSeFnhjNVakG0MarU76tScV072CG6uwlk17fK519DsPWEBO8DDUKixAJNwQWi5g
         FCOAaejNn/V9tQAcY3/UGasrDhNj95+J4ZBSQtBtvKXUYqI86f1nWdsCMxo8U1ePIvRb
         OHxg==
X-Forwarded-Encrypted: i=1; AJvYcCVwe51FKCL6TjnJxJGayPDQGoCXFbj6KKQ9DFbKWLok4SGv6mHLFD7Yu1pcC1hLW7uGiJrFOtC/pZvBxopt3ZMWPQFuq+AiyKiVLw==
X-Gm-Message-State: AOJu0YwrcBE6j3YACy/oK1XH1cwgHefVK1Vgb8QAPCe1DZcO0MBsPdXK
	LSp6F19aNfCM5ssrX5M2kLbjvdkhHwMaeacvPhMwUbasCW+kkaJXew00urM+WQqXpjC0ZpyLgxW
	laQ==
X-Google-Smtp-Source: AGHT+IGqcs/EmSI3qabDNZ1kSDkVdc1rK39WP8naNRXVdbTy2XE4VAXP7npVp68Qm95FUBEb4i3B54q0OQc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:6d0a:b0:62c:fa1a:21d2 with SMTP id
 00721157ae682-643aaa7d245mr5660817b3.1.1719411765419; Wed, 26 Jun 2024
 07:22:45 -0700 (PDT)
Date: Wed, 26 Jun 2024 07:22:43 -0700
In-Reply-To: <20240621134041.3170480-5-michael.roth@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240621134041.3170480-1-michael.roth@amd.com> <20240621134041.3170480-5-michael.roth@amd.com>
Message-ID: <ZnwkMyy1kgu0dFdv@google.com>
Subject: Re: [PATCH v1 4/5] KVM: Introduce KVM_EXIT_COCO exit type
From: Sean Christopherson <seanjc@google.com>
To: Michael Roth <michael.roth@amd.com>
Cc: kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org, pbonzini@redhat.com, 
	jroedel@suse.de, thomas.lendacky@amd.com, pgonda@google.com, 
	ashish.kalra@amd.com, bp@alien8.de, pankaj.gupta@amd.com, 
	liam.merwick@oracle.com
Content-Type: text/plain; charset="us-ascii"

On Fri, Jun 21, 2024, Michael Roth wrote:
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index ecfa25b505e7..2eea9828d9aa 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -7122,6 +7122,97 @@ Please note that the kernel is allowed to use the kvm_run structure as the
>  primary storage for certain register types. Therefore, the kernel may use the
>  values in kvm_run even if the corresponding bit in kvm_dirty_regs is not set.
>  
> +::
> +
> +		/* KVM_EXIT_COCO */
> +		struct kvm_exit_coco {
> +		#define KVM_EXIT_COCO_REQ_CERTS			0
> +		#define KVM_EXIT_COCO_MAX			1
> +			__u8 nr;
> +			__u8 pad0[7];
> +			union {
> +				struct {
> +					__u64 gfn;
> +					__u32 npages;
> +		#define KVM_EXIT_COCO_REQ_CERTS_ERR_INVALID_LEN		1
> +		#define KVM_EXIT_COCO_REQ_CERTS_ERR_GENERIC		(1 << 31)

Unless I'm mistaken, these error codes are defined by the GHCB, which means the
values matter, i.e. aren't arbitrary KVM-defined values.

I forget exactly what we discussed in PUCK, but for the error codes, I think KVM
should either define it's own values that are completely disconnected from any
"harware" spec, or KVM should very explicitly #define all hardware values and have
the semantics of "ret" be vendor specific.  A hybrid approach doesn't really work,
e.g. KVM_EXIT_COCO_REQ_CERTS_ERR_GENERIC isn't used anywhere and and looks quite odd.

My vote is for vendor specific error codes, because unlike having a common user
exit reason+struct, I don't think arch-neutral error codes will minimize KVM's ABI,
I think it'll do the exact opposite.  The only thing we need to require is that
'0' == success.

E.g. I think we can end up with something like:

  static int snp_complete_req_certs(struct kvm_vcpu *vcpu)
  {
	struct vcpu_svm *svm = to_svm(vcpu);
	struct vmcb_control_area *control = &svm->vmcb->control;

	if (vcpu->run->coco.req_certs.ret)
		if (vcpu->run->coco.req_certs.ret == SNP_GUEST_VMM_ERR_INVALID_LEN)
			vcpu->arch.regs[VCPU_REGS_RBX] = vcpu->run->coco.req_certs.npages;

		ghcb_set_sw_exit_info_2(svm->sev_es.ghcb,
					SNP_GUEST_ERR(vcpu->run->coco.req_certs.ret, 0));
		return 1;
	}

	return snp_handle_guest_req(svm, control->exit_info_1, control->exit_info_2);
  }

> +					__u32 ret;
> +				} req_certs;
> +			};
