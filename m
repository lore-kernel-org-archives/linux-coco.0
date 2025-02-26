Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8474814D283
	for <linux-coco@lists.linux.dev>; Wed, 26 Feb 2025 14:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740580041; cv=none; b=omMaRv8vNhJeSP7Kr3EMxco5AQ5Ovnbe1hG4S8bWNWNUvYJm6juL0yj2nUPDuORdFxf0Wsy7/64TaQNB2OOcarH7EZA5jP2Fb2eNYjQWK48+W9ow9I9VkoD0TIitVljq9bhpTnVgqi4lMVs8CkqdbWqWv1LKuPj/URRNYzrxOTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740580041; c=relaxed/simple;
	bh=EVDB5ihtgZeieRnrugyEXIDrswGJIhn4/GuR5gLfv2A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=urHAuORpGC/gb2HAoUI+RwfpOFJq9nNl3i84CLmOErkbcXR+dWFfiLpI5VLPS9IrAfeR9K07CiTFBhcNLJfaRF6QBjwg3xqlV33Z07bu71LxgRB9UybZNoBPV5d868kXizDWfF1ZQMluWCTmqUUj6T/xW8kQZn221UNiGDMBnmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MO06BlOz; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MO06BlOz"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2fc0bc05c00so22160839a91.2
        for <linux-coco@lists.linux.dev>; Wed, 26 Feb 2025 06:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740580039; x=1741184839; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eaRjEj+S+iNUpexzYhTHe/q7bOyFL6g0TekFIq/1o1g=;
        b=MO06BlOzegygdQGXrHcHUFJe006RMWB+KeUWFtMJRaHBmCC+LrQMEnLkRg5JtphXRH
         v+TTpjzoNqeSYhfX3s9musRUkrn5nFLiRcL44FNwWj79mqLF4FgCx+0Aw8QqPjZ6Pqzh
         IBxhBN5TJ4J1L70IBiaCxngTdQEfc46JuLLnDLIAx8cz6DephNm3s8/okA81Bq7Ar8eH
         SDxd/LZVIa9BtKSsCDas24ZjOo+K1Db+SdO5ysHFB4xPOe9ZJvBXB95nyKVB/eoPq2na
         bJ7EJAgWUlnv7Qoigj4VmE2GE3n+//7eDCN3wXkHSoYq1/O5Tk3KZ4gyja5/NMoxit3Q
         Ed/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740580039; x=1741184839;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eaRjEj+S+iNUpexzYhTHe/q7bOyFL6g0TekFIq/1o1g=;
        b=lISmzyNPnUoHsnMig9dp0sM3vLFmxF/VDd861GWndF7U1Kfv4gN65NIJ0ymIvldCjd
         lHJV4aoy4b0uUEkq/qdbCne5JGllNPfDfZE8X27gWZ8gZ2TesL2T0ixPF8lLd/ZJA7zt
         4EHFvquOzfAqRhfjVydBalH4B413DOW7tp331NSEJPXnrjpaL5MfD04F9a1FUS98/hmZ
         fm3l6vkl0hdC7B6MNNvBvPMzqD2aBN6Ti8l78ZlgEC+9QqchEJ2Ry2dD9W8KIGSu5b3m
         bP5OufZP8PvEng1YGEbxoA9WpKS9JrvqNuD6GWdyDvj9SSZ0yqaILAuozEBCltTl9swy
         07RA==
X-Forwarded-Encrypted: i=1; AJvYcCVCxCDduXTBValFtTvYbPVhVgvKcheioddSRvNDBcH31M/U5NQ22Fz1zroOjDWQRMSRiM4TPvRGXWqE@lists.linux.dev
X-Gm-Message-State: AOJu0YyV1o346/8Kmch1QXKnMvsy27TFn3b7WU2GTT0UAZlrQ4A8arZa
	KaggfbkKRePYeG58UW99yTzYY2KqE3CwP6BtdM1O2R4YOKI057Bic3PyOSLXHTUA8lxzgUf6g9X
	bmA==
X-Google-Smtp-Source: AGHT+IFswkBOj+OW+b1B+n/Joz6AyKOkyChMtV3kE6V2sRCzgJx4EB1M/qGFGRbf1byqZAHdlEsQn9PZhSg=
X-Received: from pjb8.prod.google.com ([2002:a17:90b:2f08:b0:2ea:5613:4d5d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:540c:b0:2ea:83a0:47a5
 with SMTP id 98e67ed59e1d1-2fe68acd777mr11441995a91.4.1740580038672; Wed, 26
 Feb 2025 06:27:18 -0800 (PST)
Date: Wed, 26 Feb 2025 06:27:11 -0800
In-Reply-To: <Z7yc8-QXXVPzr2K8@suse.de>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250219151505.3538323-1-michael.roth@amd.com>
 <20250219151505.3538323-2-michael.roth@amd.com> <Z7yc8-QXXVPzr2K8@suse.de>
Message-ID: <Z78kv-hhU6AWyufz@google.com>
Subject: Re: [PATCH v5 1/1] KVM: Introduce KVM_EXIT_SNP_REQ_CERTS for SNP certificate-fetching
From: Sean Christopherson <seanjc@google.com>
To: Joerg Roedel <jroedel@suse.de>
Cc: Michael Roth <michael.roth@amd.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, pbonzini@redhat.com, thomas.lendacky@amd.com, 
	ashish.kalra@amd.com, liam.merwick@oracle.com, pankaj.gupta@amd.com, 
	dionnaglaze@google.com, huibo.wang@amd.com
Content-Type: text/plain; charset="us-ascii"

On Mon, Feb 24, 2025, Joerg Roedel wrote:
> Hi Michael,
> 
> On Wed, Feb 19, 2025 at 09:15:05AM -0600, Michael Roth wrote:
> > +  - If some other error occurred, userspace must set `ret` to ``EIO``.
> > +    (This is to reserve special meaning for unused error codes in the
> > +    future.)
> 
> [...]
> 
> > +static int snp_complete_req_certs(struct kvm_vcpu *vcpu)
> > +{
> > +	struct vcpu_svm *svm = to_svm(vcpu);
> > +	struct vmcb_control_area *control = &svm->vmcb->control;
> > +
> > +	if (vcpu->run->snp_req_certs.ret) {
> > +		if (vcpu->run->snp_req_certs.ret == ENOSPC) {
> > +			vcpu->arch.regs[VCPU_REGS_RBX] = vcpu->run->snp_req_certs.npages;
> > +			ghcb_set_sw_exit_info_2(svm->sev_es.ghcb,
> > +						SNP_GUEST_ERR(SNP_GUEST_VMM_ERR_INVALID_LEN, 0));
> > +		} else if (vcpu->run->snp_req_certs.ret == EAGAIN) {
> > +			ghcb_set_sw_exit_info_2(svm->sev_es.ghcb,
> > +						SNP_GUEST_ERR(SNP_GUEST_VMM_ERR_BUSY, 0));
> > +		} else {
> > +			ghcb_set_sw_exit_info_2(svm->sev_es.ghcb,
> > +						SNP_GUEST_ERR(SNP_GUEST_VMM_ERR_GENERIC, 0));
> > +		}
> 
> According to the documentation above, there should be a block checking
> for EIO which injects SNP_GUEST_VMM_ERR_GENERIC and the else block
> should return with EINVAL to user-space, no?

Yeah.  It feels a bit ridiculous, but it would be quite unfortunate to go through
the extra effort of decoupling KVM's error handling from the GHCB error code, only
for it to all fall apart due to not enforcing the "return" value.
