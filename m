Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E43137E310
	for <linux-coco@lists.linux.dev>; Wed, 14 Jan 2026 21:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768427309; cv=none; b=ErCGHRmKtNjHM3nnwHN3l1crLOBkbyv0Xzj+dK5I9p9ptN95DGDthuQVdgz9vbljcVCfMKY1zlI6mNwY8YQJkGYIpBeuqZSus6I6+zmTIRDYaLryk36Cfou/mJLFtznHZLTNnV7KI1rcVaQopM7yVIPLFMxzaWnZHTS/lvzEV/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768427309; c=relaxed/simple;
	bh=sYapoanqDNVjmowm3U98DjxSpn0xFT5o0faGgzukwF4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jf/msk3/4AUQne9y9bdPyMKmCWXJpiUxVP4cOaYruDOC2nd5U4XIoaIHdbUJLEQp8ymNisxavyizdMrEHErjk+WDOPN1AtiukptX2h6B7RnwXtD7PKFZe2C/RpJkwT2DL4M71C1P2d28Kc3/CrRk3PdqDUHYjTxRfbQR7peMcis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xzQG4uA9; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xzQG4uA9"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-34c3501d784so134474a91.1
        for <linux-coco@lists.linux.dev>; Wed, 14 Jan 2026 13:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768427287; x=1769032087; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Folo1QSQIeNygTDacssAH4wR+caKLjy6AQ6SgfkeFFU=;
        b=xzQG4uA9ciYsnWxOFZkNaIAB8AomZ7bIeBwjM23no17fGsPJqbH9FfPO/RuFWQLZg5
         UFaWysDDauz7UVMtNkCOm891NAOywmSSmpvUDZf+h1cXjt0Yad8K2kcp2nZH7j0s9CUy
         JtpW+80UlhPux22XnOX5Ox5tTgo/lUa8/8MI6R13zwmwR2A9QgsQKIIR482cxecyQfsa
         jx259Ql/80l3sQucJSyhKdIc39V2U6vX49UYkjsa+uxhkES1ohkFNEnhY33EGIK8oYDJ
         2yWjqy2T5vhyjciIIfHI9732WZKCuEy4xF2t/z77d/5p8Z6PzTgpK4QY2QhUK6WcqxTY
         0wQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768427287; x=1769032087;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Folo1QSQIeNygTDacssAH4wR+caKLjy6AQ6SgfkeFFU=;
        b=AoQXKVjlA6kpjfn593ur2Zk02IYkd/kfixqPQf0eFc54r+ptfOnrz4ZNUA6yL9j/NY
         YAZwrFQY26SbolLbqfawf3FaYiBuvwXZneTI3nkELst++e/qPvB+kxiovduMLS8gUpUl
         O45PxArPvoLZ+JmQg2tPOwDNDrjKXmWGvNFFj2515Nk1aqF7e9zMecDwpCHoMfrox7Bx
         oIRjni3mMZcE8bNushK1HzjX0kH0f53487LXEDeZQHcfwR9FVdlJDh8ugN+dKZPMJyly
         v31G4IE9ScEKMRLQanJkyyYMb8J0N+bysYC4xJ15Snxu+yt/YcJunBnGJ+8CE+aain5C
         RxKA==
X-Forwarded-Encrypted: i=1; AJvYcCXnmKRC9FDN6A+MxqC7uBzA7ORd/0PK6iOhzyzBpXcpY/JnunnDfPcYYkz9M72zmBpAWGZhv+zstpw1@lists.linux.dev
X-Gm-Message-State: AOJu0YxnExkZmhuKqammIiClb2xDxhsJWOOoAP+AmLeg5mbIZfC5xARw
	ybKWbA6/AHrBjIVbWe86RAdSb4ZjoWi+VVXpKxVjFuQhjKzyye21zxXUduXy4hjp8vFqq1NklSw
	uBETVqw==
X-Received: from pjso10.prod.google.com ([2002:a17:90a:c08a:b0:349:3867:ccc1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:57ed:b0:340:c060:4d44
 with SMTP id 98e67ed59e1d1-351090b100fmr3848862a91.14.1768427286993; Wed, 14
 Jan 2026 13:48:06 -0800 (PST)
Date: Wed, 14 Jan 2026 13:48:05 -0800
In-Reply-To: <aWe8zESCJ0ZeAOT3@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260114003015.1386066-1-sagis@google.com> <43a0558a-4cca-4d9c-97dc-ffd085186fd9@intel.com>
 <aWe8zESCJ0ZeAOT3@google.com>
Message-ID: <aWgPFQOQRr3xcMjh@google.com>
Subject: Re: [PATCH] KVM: TDX: Allow userspace to return errors to guest for MAPGPA
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Sagi Shahar <sagis@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Thomas Gleixner <tglx@kernel.org>, 
	Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	Vishal Annapurve <vannapurve@google.com>, Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="us-ascii"

+Mike

On Wed, Jan 14, 2026, Sean Christopherson wrote:
> On Wed, Jan 14, 2026, Xiaoyao Li wrote:
> > On 1/14/2026 8:30 AM, Sagi Shahar wrote:
> > So it needs to be
> > 
> > 	if (vcpu->run->hypercall.ret == -EBUSY)
> > 		tdvmcall_set_return_code(vcpu, TDVMCALL_STATUS_RETRY);
> > 	else
> > 		tdvmcall_set_return_code(vcpu, TDVMCALL_STATUS_INVALID_OPERAND);
> 
> No, because assuming everything except -EBUSY translates to
> TDVMCALL_STATUS_INVALID_OPERAND paints KVM back into the same corner its already
> in.  What I care most about is eliminating KVM's assumption that a non-zero
> hypercall.ret means TDVMCALL_STATUS_INVALID_OPERAND.
> 
> For the new ABI, I see two options:
> 
>  1. Translate -errno as done in this patch.
>  2. Propagate hypercall.ret directly to the TDVMCALL return code, i.e. let
>     userspace set any return code it wants.
> 
> #1 has the downside of needing KVM changes and new uAPI every time a new return
> code is supported.
> 
> #2 has the downside of preventing KVM from establishing its own ABI around the
> return code, and making the return code vendor specific.  E.g. if KVM ever wanted
> to do something in response to -EBUSY beyond propagating the error to the guest,
> then we can't reasonably do that with #2.
> 
> Whatever we do, I want to change snp_complete_psc_msr() and snp_complete_one_psc()
> in the same patch, so that whatever ABI we establish is common to TDX and SNP.
> 
> See also https://lore.kernel.org/all/Zn8YM-s0TRUk-6T-@google.com.

Aha!  Finally.  I *knew* we had discussed this more recently.  The SNP series to
add KVM_EXIT_SNP_REQ_CERTS uses a similar pattern.  Note its intentional use of
positive values, because that's what userspace sees in errno.  This code should
do the same.  Oh, and we need to choose between EAGAIN and EBUSY...

	switch (READ_ONCE(vcpu->run->snp_req_certs.ret)) {
	case 0:
		return snp_handle_guest_req(svm, control->exit_info_1,
					    control->exit_info_2);
	case ENOSPC:
		vcpu->arch.regs[VCPU_REGS_RBX] = vcpu->run->snp_req_certs.npages;
		return snp_req_certs_err(svm, SNP_GUEST_VMM_ERR_INVALID_LEN);
	case EAGAIN:
		return snp_req_certs_err(svm, SNP_GUEST_VMM_ERR_BUSY);
	case EIO:
		return snp_req_certs_err(svm, SNP_GUEST_VMM_ERR_GENERIC);
	default:
		break;
	}


https://lore.kernel.org/all/20260109231732.1160759-2-michael.roth@amd.com
