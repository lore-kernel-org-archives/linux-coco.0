Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5477F238C1B
	for <linux-coco@lists.linux.dev>; Tue, 14 Oct 2025 19:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760468731; cv=none; b=GcveGwTT22nlzElxgeirH4xmTRw1bjVUXQZrCYlyO6YAE+p3gcyz8vwKzr6QAO7ota0hY+ZxebvfHhqIA0aqr+a4wO1dHEHVyH6IK30qsCNjCpTJkXAzcoW34qFaB4QQfWIN4rhoyLsCK9Khz2KLeuI0tQSo2Otqe7YHabQil1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760468731; c=relaxed/simple;
	bh=k7sLOjS3mwqYX0wOEW1KBhtCAUTziTwPywv1CTVyHNc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iEOfCCXI/qG5ulERqVdOdbyuGJf6vkXYYBQcz8rIZYbaacNycjEQDvNlyJ0rFgt86tVPVDYQ5KwYJjFQcznnExWDxc1UYxgiLP5zZ+vZKOj4PhQi2cU5ppvEysOVjvgMPSCax4l4bH21B3Uzu2XZSJUK8IHk+j2trT0Hw4fhK7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s5vIKXrN; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s5vIKXrN"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-339ee7532b9so26313884a91.3
        for <linux-coco@lists.linux.dev>; Tue, 14 Oct 2025 12:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760468730; x=1761073530; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rc58PPiWOIscw4gzc1uP4pr7xQS6V7163kSeQz2T208=;
        b=s5vIKXrNRXktMriPssQOcGI+pfan4ToJ8TsxrDCKee8I+mT4fJZjDBwFfqFGvOIoCc
         du891h1IyO9sOZOzYL4rW4RNlWkPtCG+dLI6X9/ujxW6BEdaf2Fim5p8IofeH5xhAbb3
         nj0rtBAyL38kC5V2NTVCwCmC5tp4E42Rwz4DI0CAXY87HvJhBqmaBHRfxXYd0rqFffBU
         6vxQhT4OzUwMtgTJsIbZzdOcWy0yKtxRLGD0Ne4d8eUPj+qqO7wcGdjxPh8NbcKrVDkM
         tj0sYBJ5ZTNEUYRbe45EHPNUsV9PgjEu0azhnpVRgJDBnlb11oJKUd2H8+gdLwD+2+A0
         Vy+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760468730; x=1761073530;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rc58PPiWOIscw4gzc1uP4pr7xQS6V7163kSeQz2T208=;
        b=Kg9sP5IojElNc+AXCX8rzadyY0JqJEiInGKluJRg/fDZXjaRZvURZIv1daNluV3P5j
         Fre5cmXtiYuNJF3pf5sZd7Rtm4heSe4RcVNpPjlD/kPN1gaCvVMLr7Iqi8gND7bbCcJ5
         HQlcLgex5is4TlMo/pyUSZeUbxXc9RcyudHUwwbCfm/K2KBg41ahbOnWwlGHCKxTNILV
         nePZCtHQMpDiMu1GcWV9BS/uizrGtcTewjUE0KfMOHGFEdbI5Y/e9DuCB4IiL4hw80+j
         pUwZVJ5B7IFOYUc8ZMGq0iaecMtWbmcv1v9o+ujdk4ACWnx0cuYX8RByFE+bi3HbTEo/
         7VUg==
X-Forwarded-Encrypted: i=1; AJvYcCVEniPLrE45NjSr0wDgGGrjtfRsiQIKnSrsnKAiXLqkVp87iKiBQScqoc1DcHAiMS7SVC2jVyezarHV@lists.linux.dev
X-Gm-Message-State: AOJu0YxHSmy4b1eVPhnfsgzR+FXZyZr4UUCmqWKiy8ROHHJWDbAjF5F4
	bZJZflsYFMYwc0WeXdwWT0+pAh6Fxy+K5zjyeYsIODPmmBD2VkBuKX83VvjA8LLElf/y/lhw50W
	QUlQZiQ==
X-Google-Smtp-Source: AGHT+IFPeoJzDvTAF6xr4A7hQhLSCx/6X0JPH4z/3Z9BNtyzLqFJ4dyjiFG5gqILjbnBFdR2+iVHQHmVLHk=
X-Received: from pjbga22.prod.google.com ([2002:a17:90b:396:b0:32f:46d:993b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:224a:b0:336:9dcf:ed14
 with SMTP id 98e67ed59e1d1-33b51375a05mr37471970a91.23.1760468729683; Tue, 14
 Oct 2025 12:05:29 -0700 (PDT)
Date: Tue, 14 Oct 2025 12:05:27 -0700
In-Reply-To: <68ee9bcf14fea_2f899100d2@dwillia2-mobl4.notmuch>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251010220403.987927-1-seanjc@google.com> <20251010220403.987927-4-seanjc@google.com>
 <ffc9e29aa6b9175bde23a522409a731d5de5f169.camel@intel.com>
 <aO1oKWbjeswQ-wZO@google.com> <aO4LVTvnsvt/UA+4@intel.com> <68ee9bcf14fea_2f899100d2@dwillia2-mobl4.notmuch>
Message-ID: <aO6e9xuii8vsuNQH@google.com>
Subject: Re: [RFC PATCH 3/4] KVM: x86/tdx: Do VMXON and TDX-Module
 initialization during tdx_init()
From: Sean Christopherson <seanjc@google.com>
To: dan.j.williams@intel.com
Cc: Chao Gao <chao.gao@intel.com>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, 
	"x86@kernel.org" <x86@kernel.org>, "kas@kernel.org" <kas@kernel.org>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "mingo@redhat.com" <mingo@redhat.com>, 
	"tglx@linutronix.de" <tglx@linutronix.de>, "bp@alien8.de" <bp@alien8.de>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, Kai Huang <kai.huang@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "xin@zytor.com" <xin@zytor.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Oct 14, 2025, dan.j.williams@intel.com wrote:
> Chao Gao wrote:
> > >> Also, can we name the two tdx_offline_cpu()'s differently? This one is all about
> > >> keyid's being in use. tdx_hkid_offline_cpu()?
> > >
> > >Ya.  And change the description to "kvm/cpu/tdx:hkid_packages"?  Or something
> > >like that.
> > >
> > 
> > Is it a good idea to consolidate the two tdx_offline_cpu() functions, i.e.,
> > integrate KVM's version into x86 core?
> 
> This looks good to me, some additional cleanup opportunities below:

+1.  This crossed my mind as well, but for once I reeled myself in as I'm very
susceptible to self-induced scope creep :-)
