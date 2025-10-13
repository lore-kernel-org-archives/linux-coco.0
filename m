Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D940243374
	for <linux-coco@lists.linux.dev>; Mon, 13 Oct 2025 23:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760399686; cv=none; b=NF5ZKjLmmUrxKMiJFV+Rq+JB4TaAcvlAPPrfh6Ecwg4yVAroBOjSkl6IXPNCjgwfKIJQ+6eauvZw+RS7AkBB9PXflSzBuKJFskmAJGPjhmVskZ8/g/AC3SAk6wMyv1toJa5obToa49sfWSFVGsHqsZn2mqbQw7ViMjf9FKMsSGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760399686; c=relaxed/simple;
	bh=wt8ABhQBNkuDTssrmADKWdmhe2+xsFwQvydnfFEZuw4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qvhWSVgFNJnlhWwWMJntQ41cok2NilveoQeLexkAimAJVy2Np8CDWsZHHr2xs7LT4KtKzg1imKpKws+H6hsu7gE5nGf4nKKwj1VsBHi+ZXAR4htPE3Bb2SMLhtWfRZIWvQ6PWtRvMr+YZ4g3GsT7OUaZQW+z/bcSAx8MRlCdPQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ccB3JcWr; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ccB3JcWr"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-28a5b8b12bbso191426455ad.2
        for <linux-coco@lists.linux.dev>; Mon, 13 Oct 2025 16:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760399684; x=1761004484; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5eSzM1BbjacPfILv0jrYJHzJQhHV06H7cFKDBkrRkvg=;
        b=ccB3JcWrMpeeWHtQZT+WnTozweawQkD/FHTXBd3DSDItFm/RZ2Kq86m+9nzld8gz0e
         GZV9R0EJKZF8r4gCXOd4YajmK6evvAX5JafR3wYjT9hzC3Gx5kq8dizYQlu3hYDLLUjQ
         65RVpEdmEWpBu0rYQylZOYazdNbjeoMLM6W611HaKs5bGdoE6vKdi/Fu2FM5YCr9iwJH
         8NVMTsLb1qsZR+PLfwZ+2bUfXnjXRRuOigQxoiavgdixZ08h3dBuozmwYHLRmCyu/o2J
         oMEljtoatksn5jra9ZYsveO7rVgxZEzYUEh/UqeOPZDqJLp/V/Qu72AXxmntzsiKVd+W
         sxBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760399684; x=1761004484;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5eSzM1BbjacPfILv0jrYJHzJQhHV06H7cFKDBkrRkvg=;
        b=RqnybPAQA4x6N24/5041l+9Mxc62naeC7MUnx1Jvxo088w0pqr06zDRJmfr4YrWIZH
         ZI3PwAKHvxYe2D8yIbUskIXqB9qppVZhLUB6YSuHVp/GnZBG0GpS+26lBZsUT+ntj80o
         rEEJ3uwk2E3oQzZ275Bb7N7vPh5EhuE9HnCG4FBXmF29NCOA4yYNdFjLprThFT53cSMc
         sVD5237cPIBxA/H9c9ze9/hiqmiUZCLXpCLmTYBTMqDrs3dkXeuGXCvRrLWbALhhhfT6
         ARCvhRYnn1HYkRTCA8yCx13SbF+YmsTvypnZowmBjE706emXC0TGirpwPmA3onAr2/Rd
         OFXw==
X-Forwarded-Encrypted: i=1; AJvYcCUnKccts68UtmWZ0r8VHb3aCJ/LScst7TFV62gKD/Ybj3S9U7AI2CcySPQ1YUDrFM07BRwfXVvoR53V@lists.linux.dev
X-Gm-Message-State: AOJu0YxNEzAA7JS373YdwH+XaeFZUHLCv1iyeSesr+ZtSdyPB8QuwVRm
	rYIsYh9dabiILNIH/lz/yuQKgWIPpxqxS2I5oNY2Dd8jKvAF64ihRFNeGI39SrfFPkySUwf/lOA
	a7tDoiw==
X-Google-Smtp-Source: AGHT+IFG+BjAtYLOX1KiZpqF3jGYRoMOZPFJ6jl35/04RXhu8tJ/N/pUxAQejmx4mm6AggTYbzBFwK4lnFo=
X-Received: from plsd3.prod.google.com ([2002:a17:902:b703:b0:27d:6f45:42ec])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:246:b0:24c:9309:5883
 with SMTP id d9443c01a7336-290273ecb35mr293031675ad.28.1760399683860; Mon, 13
 Oct 2025 16:54:43 -0700 (PDT)
Date: Mon, 13 Oct 2025 16:54:42 -0700
In-Reply-To: <d75130b0a0fb9602fa8712a620cb1f7e52606ea4.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251010220403.987927-1-seanjc@google.com> <20251010220403.987927-3-seanjc@google.com>
 <d75130b0a0fb9602fa8712a620cb1f7e52606ea4.camel@intel.com>
Message-ID: <aO2RQu-xuSC0GGnn@google.com>
Subject: Re: [RFC PATCH 2/4] KVM: x86: Extract VMXON and EFER.SVME enablement
 to kernel
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: "x86@kernel.org" <x86@kernel.org>, "kas@kernel.org" <kas@kernel.org>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "mingo@redhat.com" <mingo@redhat.com>, 
	"tglx@linutronix.de" <tglx@linutronix.de>, "bp@alien8.de" <bp@alien8.de>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, Chao Gao <chao.gao@intel.com>, 
	Kai Huang <kai.huang@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dan J Williams <dan.j.williams@intel.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "xin@zytor.com" <xin@zytor.com>
Content-Type: text/plain; charset="us-ascii"

On Mon, Oct 13, 2025, Rick P Edgecombe wrote:
> On Fri, 2025-10-10 at 15:04 -0700, Sean Christopherson wrote:
> 
> > +
> > +int x86_virt_get_cpu(int feat)
> > +{
> > +	int r;
> > +
> > +	if (!x86_virt_initialized)
> > +		return -EOPNOTSUPP;
> > +
> > +	if (this_cpu_inc_return(virtualization_nr_users) > 1)
> > +		return 0;
> > +
> > +	if (x86_virt_is_vmx() && feat == X86_FEATURE_VMX)
> > +		r = x86_vmx_get_cpu();
> > +	else if (x86_virt_is_svm() && feat == X86_FEATURE_SVM)
> > +		r = x86_svm_get_cpu();
> > +	else
> > +		r = -EOPNOTSUPP;
> > +
> > +	if (r)
> > +		WARN_ON_ONCE(this_cpu_dec_return(virtualization_nr_users));
> > +
> > +	return r;
> > +}
> > +EXPORT_SYMBOL_GPL(x86_virt_get_cpu);
> 
> Not sure if I missed some previous discussion or future plans, but doing this
> via X86_FEATURE_FOO seems excessive. We could just have x86_virt_get_cpu(void)
> afaict? Curious if there is a plan for other things to go here?

I want to avoid potential problems due to kvm-amd.ko doing x86_virt_get_cpu() and
succeeding on an Intel CPU, and vice versa.  The obvious alternative would be to
have wrappers for VMX and SVM and then do whatever internally, but we'd need some
form of tracking internally no matter what, and I prefer X86_FEATURE_{SVM,VMX}
over one or more booleans.

FWIW, after Chao's feedback, this is what I have locally (a little less foo),
where x86_virt_feature is set during x86_virt_init().

int x86_virt_get_cpu(int feat)
{
	int r;

	if (!x86_virt_feature || x86_virt_feature != feat)
		return -EOPNOTSUPP;

	if (this_cpu_inc_return(virtualization_nr_users) > 1)
		return 0;

	r = x86_virt_call(get_cpu);
	if (r)
		WARN_ON_ONCE(this_cpu_dec_return(virtualization_nr_users));

	return r;
}
EXPORT_SYMBOL_GPL(x86_virt_get_cpu);
