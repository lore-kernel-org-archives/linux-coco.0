Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0232E2DD2
	for <linux-coco@lists.linux.dev>; Fri,  6 Feb 2026 16:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770393840; cv=none; b=tKxTaFjfodcJ6ckIpGkSnV0y6Qxw4x/aJLeUvARwurvTGzac3N+lA2a/IDVoI42dpGSOWaJurRbvN86AFQ9Kbz3svOsN4XfDZZAUo3FAKxNGBa0QUu57FzGKrYCQAAnPN0Plv17gRekic9Dh2m6xghZE94Kw4RkGK/BGfDmeLDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770393840; c=relaxed/simple;
	bh=3raR9XQBcm6pX1dp9l802LPULeByXkutMSrcWOv542Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RroaUwuK+mpbAxAnD8DzYibhvJR1rhJWC8qAhkz8eLSJBYlt7BJcJee0REbPFatNrRNne/biVOGw9TKKTCWaHVUelmx7vUUX7RK0avcvqdhMBhXSdMyTdie+yqr+p8MRWJ2qvw+W02HxJurhOzxfreurUN4KlJpiU2sx54LWa7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MqLepiDT; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MqLepiDT"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b5edecdf94eso5638502a12.2
        for <linux-coco@lists.linux.dev>; Fri, 06 Feb 2026 08:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770393840; x=1770998640; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6W5ywYYSvCRSPwqFTbeco0aLvB9nOdCSyf5b4W1ZEGc=;
        b=MqLepiDT1e7oqNsYDigLUozfJzi2t+62GiOTTAaOiR3uVti8laaNAu1YS0lJmJASBU
         rSUedSJ4Nx3meLDTxc6P7YxHW/vgTTPZBJrQ40H/AjA7jWv+QH28DCJZOyNWNZ3XDLAR
         FGz+ubp3X5TxBtwJGH3Cw4Fk/K/N11CR+yuAi4LVfjv9HmCqYcVMj+u9ulJfY5FYOvfS
         03PytnX0VmGfn+y5nkejmMKLTMYjR4AoNw9QAxz2LJTulOLJgzXazenCQNUR6Mcu23Pm
         jo9HpR2tPvQYBzeFzc66dKDmvisnNXhbAXE9NnNNtq47h6gK0/lrn8GjoiTNM2Wxn1BQ
         Gy2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770393840; x=1770998640;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6W5ywYYSvCRSPwqFTbeco0aLvB9nOdCSyf5b4W1ZEGc=;
        b=sL5saoVksII3UX99M/ntNEZzNQu6TraDrNiEoohol5h427rZEgvpVdqkC485hvzyxG
         Tudb18VoGLpzwFDky8H4ncHfSEA7ONWuFK7hc5Ke2THMkL2WuX11jEXVdpJ/K6Elps8W
         sL1CBR1c6rEcQZDp+JOpPmTQL+oI9Sskt8hgkkJmmXxCdUceDLZ0PFZTQ2NisC+W3Ez4
         ZMYj6miUHXDcC+vA6GnAmxFwDXMxxLGXa7OR86gWWvxmV05KLfCiHyARJv9q8B3x84FS
         Nfl7qy2LLf5WqU3eMGAYgvxEBqmgbFo1+Shub8zNzRpcsdFfNF6aJi0Jd/JFb78peHMO
         ytlg==
X-Forwarded-Encrypted: i=1; AJvYcCVmW0K6YF2azuTExIbMY2FOe2YCc08JDhJLBNOfb9pbZ0fbLnMg99uKBW6AKxyJu5cHxqU2ZWb9s53u@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7O5qE1TwKv8Kt6Ep1FpeJyp5iO83iN16iZcz/C1a9EwGXmgyz
	EWTUotx06NOkowWK8RWkCZAI41ApdzZLDQy+RPKRktTpYrGsSL1vvljZW6hpZfto8j95FWjCHnD
	ZeCUz8A==
X-Received: from pjbss7.prod.google.com ([2002:a17:90b:2ec7:b0:34c:37db:8f1b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3290:b0:393:8afb:3559
 with SMTP id adf61e73a8af0-393ad0265a9mr3268415637.32.1770393839552; Fri, 06
 Feb 2026 08:03:59 -0800 (PST)
Date: Fri, 6 Feb 2026 08:03:57 -0800
In-Reply-To: <aYXAdJV8rvWn4EQf@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com> <20260129011517.3545883-23-seanjc@google.com>
 <aYXAdJV8rvWn4EQf@yzhao56-desk.sh.intel.com>
Message-ID: <aYYQ7Vx95ZrsqwCv@google.com>
Subject: Re: [RFC PATCH v5 22/45] KVM: TDX: Get/put PAMT pages when
 (un)mapping private memory
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
	Kai Huang <kai.huang@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Sagi Shahar <sagis@google.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Feb 06, 2026, Yan Zhao wrote:
> On Wed, Jan 28, 2026 at 05:14:54PM -0800, Sean Christopherson wrote:
> > diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> > index 6e84dbc89e79..a6e4ab76b1b2 100644
> > --- a/arch/x86/include/asm/kvm_host.h
> > +++ b/arch/x86/include/asm/kvm_host.h
> > @@ -1863,6 +1863,7 @@ struct kvm_x86_ops {
> >  				    struct kvm_mmu_page *sp);
> >  	void (*remove_external_spte)(struct kvm *kvm, gfn_t gfn, enum pg_level level,
> >  				     u64 mirror_spte);
> > +	int (*topup_external_cache)(struct kvm_vcpu *vcpu, int min);
> >  
> >  
> >  	bool (*has_wbinvd_exit)(void);
> > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > index 9b5a6861e2a4..4ecbf216d96f 100644
> > --- a/arch/x86/kvm/mmu/mmu.c
> > +++ b/arch/x86/kvm/mmu/mmu.c
> > @@ -605,6 +605,10 @@ static int mmu_topup_memory_caches(struct kvm_vcpu *vcpu, bool maybe_indirect)
> >  					       PT64_ROOT_MAX_LEVEL);
> >  		if (r)
> >  			return r;
> > +
> > +		r = kvm_x86_call(topup_external_cache)(vcpu, PT64_ROOT_MAX_LEVEL);
> If this external cache is for PAMT pages allocation for guest pages only, here
> the min count should be 1 instead of PT64_ROOT_MAX_LEVEL?

Oh!  Right.  Hmm, with that in mind, it seems like topup_external_cache() isn't
quite the right interace.  It's not at all clear that, unlike the other caches,
the DPAMT cache isn't tied to the page tables, it's tied to the physical memory
being mapped into the guest.

At the very least, it seems like we should drop the @min parameter?

	int (*topup_external_cache)(struct kvm *kvm, struct kvm_vcpu *vcpu);

Though if someone has a name that better captures what the cache is used for,
without bleeding too many details into common x86...
