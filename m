Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8853F39E8
	for <linux-coco@lists.linux.dev>; Thu, 28 May 2026 13:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779974469; cv=none; b=X8DoWrdZarXXzz7m/LW9jilJevfmdZ0axlhOk1vToBZBRw6JDp0qzDxWU8EUHpmKuYw75bdVSNJ5vRsoJp1VCPCb2psyr9yuz2NX+EyORZ+mQ0rkhoWmx/eIuGLBXKGGFne79vxgJuK2OM5HxCRwOmYCa8NOazuROxhOfcsZN6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779974469; c=relaxed/simple;
	bh=KycBQ9WQVwk13VRyQWEJeBpD8BVbZhadC15kR85B8sU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nP53Vfas5yBPfEjWc9x8BVSnqhf0KbRGjaZybXM+Xe6MwK6ymKj5py1bVUZDBkOpq3N8qDiEuG0AifBW9C0VGk4+G79xjNGVgYkplvT01zYf67oUf8od4im2VwKG14L6GjYg6bOjzevTkUmkRWWBEBz24i4uCk7hEcCi+VNJqzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tTOIb3Ix; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tTOIb3Ix"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-36b7f696b40so794204a91.1
        for <linux-coco@lists.linux.dev>; Thu, 28 May 2026 06:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779974466; x=1780579266; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KycBQ9WQVwk13VRyQWEJeBpD8BVbZhadC15kR85B8sU=;
        b=tTOIb3IxWRhiMqxbkxIyyDifb3Ai7vfhq0dEdRCCUOdXorPxGHLeifbEznWZn4YP3a
         q8nxBQB+ZUhxiHYDwVFVjAvC+pGkVY6ZUmst48Xffu7G9WoaTnNSL+B2rKuzfn+Ostu1
         4nof1V6tr/AinH8SUIHIjzxYLXx/vYnCTR8g5Bg3XYoQf2BJLt7RdYD7LXqwCzrvDw/g
         AhgsE5WQOfhojqb8neKU4PttpTPiClbnsniqY9zVMMhzC5NDgQF7tybm0qwt4eoGJU0D
         fYymBSh7mFFimJ9rI/7qEK0SBUWL6RqEiF5AMYNo3jjD9RBUkDq5HLO7FGHHAMrFCGbt
         UU0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779974466; x=1780579266;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KycBQ9WQVwk13VRyQWEJeBpD8BVbZhadC15kR85B8sU=;
        b=RepQdhl9ctwrUrctl3+dH3n3hQzeTSUqW/vE+P3DVqw9cTgZV3hJB8B4hoBVXByNID
         JdoNDS14YJkb4yHeglbo7qB7l22aEZ5z07VVMRXnyU91Vq/vlG+ULilVuV82pCRT1q1m
         wy7d+iC/Sde4H+78hMpII9Rltt9DvOTu2h+kehyeSAqUpl0sgj+8d/tTTLSQ+vMN3Lie
         8mULJHdqZKf8vHmF81+kxQ9tbanJ2YjT94oKsw8hP6NrI/j4aDsW6clC3kLv9u2707Sf
         48H9J24wvYlnBnr2gyQH0BORkdmJEDW3VClPdh6/45+ZkKPZ/xflJwNN+DKYBZpnEVQP
         2FOA==
X-Forwarded-Encrypted: i=1; AFNElJ9BEBGCthFGSENFx7sbMGHiVyTfu++Nu+oKr/+x+UQ8neDkhauWnQHgblr/aWwm22/lufh3FLB/sOX2@lists.linux.dev
X-Gm-Message-State: AOJu0Yzz0eeqWoGg+gq1ByCgGR6fmrmnA2CpumtS9KDDjAUOP7x8Xi9s
	0vn2QNLsuj5tviuNTniwkZ6fZyHtCmdEgocXu/YCY+2h49Eagn6gRpvpoP3KMnvvPUmLYEueRkc
	q78XYeA==
X-Received: from pgiy11.prod.google.com ([2002:a63:de4b:0:b0:c74:497:507e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:56ce:b0:36a:cace:a4b6
 with SMTP id 98e67ed59e1d1-36acacea4d5mr18554876a91.9.1779974465476; Thu, 28
 May 2026 06:21:05 -0700 (PDT)
Date: Thu, 28 May 2026 06:21:04 -0700
In-Reply-To: <476964db-837a-45d8-a647-c5a2ea8b0cb6@suse.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260528113605.267111-1-jgross@suse.com> <a8f495f0-b4a9-42b6-be74-4fa9d83c7346@suse.com>
 <ahg-bEiwyqYTdWOD@google.com> <476964db-837a-45d8-a647-c5a2ea8b0cb6@suse.com>
Message-ID: <ahhBQDvyzHQfTCBD@google.com>
Subject: Re: [PATCH v2 0/6] KVM/x86: Drop "1" as MSR emulation return value
From: Sean Christopherson <seanjc@google.com>
To: "=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?=" <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, David Woodhouse <dwmw2@infradead.org>, 
	Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026, J=C3=BCrgen Gro=C3=9F wrote:
> On 28.05.26 15:09, Sean Christopherson wrote:
> > On Thu, May 28, 2026, Juergen Gross wrote:
> > > Please disregard this series, there is one complication sashiko made =
me
> > > aware of.
> >=20
> > Sashiko beat me to the punch. :-)
> >=20
> > See commit 2368048bf5c2 ("KVM: x86: Signal #GP, not -EPERM, on bad WRMS=
R(MCi_CTL/STATUS)")
> > for a real world example of how things can and will go wrong.
>=20
> Yeah, with Sashiko's pointer it was easy to spot.
>=20
> Question now is whether the already existing cases of -errno passed as re=
turn
> value are wrong or on purpose.=20

What are the existing cases?

> If the latter, there should be a comment for
> that, otherwise they need to be fixed..
>=20
> Disentangling the MSR emulation return values from the "normal" ones ("re=
turn
> to guest"/"return to user mode") will be quite interesting with the overl=
oaded
> semantics of "1".

LOL, "interesting".
