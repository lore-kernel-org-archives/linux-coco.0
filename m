Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9CD313536
	for <linux-coco@lists.linux.dev>; Thu, 13 Nov 2025 18:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763060105; cv=none; b=OyLx5SUvj3MvjqZOdNtnKKofiNEqze056DMt44/N/OSKMPmNutYnPPA4ZAxNlf4xnOgyHukGPFYqIFWGDQXJpn99U+AYDziecO0D6KWcrOHAYzXnDFNJeWgRo+WyblQ7nruIpfu/Fl9X2BKWQ/roHJIdxVFgzohQBXPgc3FHcj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763060105; c=relaxed/simple;
	bh=yoiGfSOa9IZY87D1XAPbPP+LEBcGhTWrEyGhdUuWork=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rLX3VsaLpQZOHsB9oW3SCy6z3ehxSJbVoiWMu9MdzUuZvfm+oF7PKkN8TW1Oh++qIQM+tpXl4zWx9IzWQ61/AM36SEpS7q7Qad80bEOJ+zw9wSV6LxOHnkHaThbNYVoVgEtsw7OffgSBeQIMAohnYjfQM9tlwIr2b7cbdDI2MPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pD5oTUxC; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pD5oTUxC"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-297df52c960so27765105ad.1
        for <linux-coco@lists.linux.dev>; Thu, 13 Nov 2025 10:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763060103; x=1763664903; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yoiGfSOa9IZY87D1XAPbPP+LEBcGhTWrEyGhdUuWork=;
        b=pD5oTUxCEtlxfQSANiBjOoMUz0oUI+PFOHUikAl1r8ID2ezDoGTlEGkvZ/BGVW0cUF
         VWqAljq/9Qlc8GvFRPqjKH1iJ4VEn2aja9y4/14poQXaVBiFtBay00Spd42YpY7V+fLI
         NiO3GvxqY7bMApB3cFPA/S031aZhgwtfe9CKFYW5bVvY0ejnAudz9WEuOwW6F3zVWRM3
         /u8eMYSwLn2MaUmPMbpHXVdYe8tg9Jdgwhu7CPKqo/SZ+Y/nx4BgcJrquzfAVeob2EGO
         hEUEaMBmMwamjTKywofZXxX2jjNjAJJIZHDx3wrOi1vvHLacwrOJh9f9yLTefh2MPjr1
         aiVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763060103; x=1763664903;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yoiGfSOa9IZY87D1XAPbPP+LEBcGhTWrEyGhdUuWork=;
        b=adYzGSC6d1QjAZPWcob12hFfyfT4stxzILUZaTwcM29EkbM+VXAUYWy/1HDyRnw3n0
         ULZeU2BstpszDalGbLGPR9N7opg1dSQeRNM3HGyRaFJ55mJehtyHRmqy+vEMJSUq6HTo
         f4kU3b2FeOOuQPacfUlwkxqUYw+Xldt0z2ZhunUpD5Zxgy84J+A7YHtd67u4QZVv1KFf
         0c+u4tZm+xSi29FKwAg/UHSE33EWJOQWDR+F2JQmSRCO/eSBT6VRXDZB78Z4abRLdrxm
         OtByrXq59/ahaX4JeRhXEwjpXHi2TzjYWwdLc6kc/uONkNPTvwaSt5TqEaQMhxDUxIiK
         tawg==
X-Forwarded-Encrypted: i=1; AJvYcCXsvY0lm0j5mxTnAYG0rCgymUHuka+eZnFSGAoLtilZUVW4SKil+pqK7NoLQEoowODs5nMRRJkRpRBL@lists.linux.dev
X-Gm-Message-State: AOJu0YzV6XyrXrBmgaNt4DwEv5vUaQ4hEmZ08tDbB/++e7/voZI+1dc2
	x0l0v7LtFuFnDMMYlo2DQMEBHJd51tHpu/guygmeF+wh/WTEhsYH993REVoglURwPKcPOFXoQNc
	rsFAT9w==
X-Google-Smtp-Source: AGHT+IEKxb5eXFzXsmYoUeXSmHh0/xueNTZwDkOb8m+X/4sGuTjMIch3iG0R64oLCQ33S67TXLy6hrtPviY=
X-Received: from plpo6.prod.google.com ([2002:a17:903:3e06:b0:297:d489:2ecd])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3b8e:b0:295:32ea:4ce5
 with SMTP id d9443c01a7336-2986a6bd29emr601245ad.6.1763060103243; Thu, 13 Nov
 2025 10:55:03 -0800 (PST)
Date: Thu, 13 Nov 2025 10:55:01 -0800
In-Reply-To: <4161146b195efee57393b65f8e9022d4bc7e443e.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251112171630.3375-1-thorsten.blum@linux.dev>
 <4a2a74e01bfd31bc4bd7a672452c2d3d513c33db.camel@intel.com>
 <aRTtGQlywvaPmb8v@google.com> <0d9e4840da85ae419b5f583c9dacee1588a509ba.camel@intel.com>
 <aRYHVHOex4zkyt5z@google.com> <4161146b195efee57393b65f8e9022d4bc7e443e.camel@intel.com>
Message-ID: <aRYphTF5Yjb_Dd-B@google.com>
Subject: Re: [PATCH RESEND] KVM: TDX: Use struct_size and simplify tdx_get_capabilities
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: "bp@alien8.de" <bp@alien8.de>, "x86@kernel.org" <x86@kernel.org>, 
	"thorsten.blum@linux.dev" <thorsten.blum@linux.dev>, "hpa@zytor.com" <hpa@zytor.com>, 
	"mingo@redhat.com" <mingo@redhat.com>, "tglx@linutronix.de" <tglx@linutronix.de>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kas@kernel.org" <kas@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025, Rick P Edgecombe wrote:
> On Thu, 2025-11-13 at 08:29 -0800, Sean Christopherson wrote:
> > Assuming you're tracking linux-next, I wouldn't bother adding kvm-x86 a=
s kvm-x86/next
> > is fed into linux-next.=C2=A0 I do push to topic branches, e.g. kvm-x86=
/tdx, before
> > merging to kvm-x86/next, but at best you might "gain" a day or two, and=
 the entire
> > reason I do "half" pushes is so that I can run everything through my te=
sting
> > before "officially" publishing it to the world.
> >=20
> > All in all, explicitly tracking anything kvm-x86 would likely be a net =
negative.
>=20
> Yea, linux-next and Linus releases. Ok, we'll leave it. I was just thinki=
ng
> about your lack of TDX testing setup, and wondering if it could help. All=
 good.

Heh, I appreciate the offer, but you probably shouldn't encourage my lazine=
ss at
this point :-)
