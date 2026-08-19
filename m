Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A4835E926
	for <linux-coco@lists.linux.dev>; Wed, 19 Aug 2026 23:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787180601; cv=none; b=IXIZNsLG7/ca5VQecARVKNcUIpvVoUFNriF0frQ/ln3pzsDS3KDa/Gihwr2Xybl2MuYd7v3c9vcvV4Yh5Q7d1iroGZf7TnDKFmCRsM5Z4FOwDRYtpDWs4qsqHPFzXQiFdF8G9+tltzvDZBB+kDTDAFtewCRS++qI0vy4F2dAA6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787180601; c=relaxed/simple;
	bh=m2qQnzZADQ7OMmhHmBNPwccWy44ZPeI32u1msndVRd8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Sjjr8Ba+6hG9pXcvjl2NiUBz52db52HKxLhXYXNscigjJqcKPsr+PkHAleA6Yu7j6tWSemdKYabpyNPOMj59PMjgkjfV2vbo4K1JhsHuDtNhkkruvIcRVtg5FezxLaf3J7wmQ5ytqdiiw+jxPmEH9YVkH8+X2EOzE49VmFcLIpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=udVNbmTV; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="udVNbmTV"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb7d6ba548eso1821355a12.1
        for <linux-coco@lists.linux.dev>; Wed, 19 Aug 2026 16:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787180600; x=1787785400; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mzAFdpn//M78ZGr88DHTgvCgt/GiFAY5vbNq/OLbPbg=;
        b=udVNbmTV8gVjcwp6Z7kCh3H8TiStuvfXE6k8BNNQ5+dN8v2ysVeDG+EVCumXQ1p70X
         RawvstkVmCISFZtc95VwI3ne3peFkkLGnHE6UPyWDTlMlJDTdT3h5IT1GiQdodQUnUb2
         WSczukWtknryeFK4e5ze+kPVM9ODZNEBMph052pAdQLV0DN2G5XmiJLE10eiB54r/GEG
         J1h4Jx2dwEXB6vcpZQ9xKeN1Qnjg093ZzMshluL5NVPcBPaYtgb3GGxgT85UgOak5rya
         dcQ99HcCJbMMQGAw5TAAjMpcjBR3Rit3e6LZKJMYO6/VoxLYW6iJb7vxiGplwQFB/gpn
         kGTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787180600; x=1787785400;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mzAFdpn//M78ZGr88DHTgvCgt/GiFAY5vbNq/OLbPbg=;
        b=d94O9GP+AL6OZw1EAsgvI9X5TXTBoRvn+/Br7l5VqawHGkUuvHFPrTCJhkPmzuFa5b
         R5+q7gcisGWNPb119LGP6E0OxCdKUWP3LHUG3kC/BuQ+s+nvfQoQH8w1/5EKhZABAZWf
         77Pqbsq5ZZ/biuRhmRjTtKC09mhMJ21rQnDbrSkf2LMoXqGbQJQK/ZDAPUx1skdFg94K
         kTrdWNVjyk7QTdn0H+3h8AdoS1kF3Bro17Ofw1HCJMoRiLtfSEIS4WCQt6jpn9w4MkEG
         86WSPbF/HV7/dIRc7sJO5oRKWB+P+TuogaIia9zR4NXjKABcjNUBljzg/f+qMmloMA0E
         S4wA==
X-Forwarded-Encrypted: i=1; AHgh+Ropu9MWsyQ90puif6fHK7AynSOUWNMa8zwJndewZkB2xf8sfNMNdMWmbmVRwTTQ3ILAw/6olT+UwW1O@lists.linux.dev
X-Gm-Message-State: AOJu0Yxypu9GnVuC5PhPs5KFJ6gDvyn13gb2qFHs434lZwlygH6BHBNj
	shPWF+B4Oen2cmb6Pdp9zDjR7ackqzyGpntjm9a/BqPynG6Ip2KMfXlKkterm06moSTl1a/ULrO
	ILGtGPA==
X-Received: from pgbee4.prod.google.com ([2002:a05:6a02:4584:b0:cb5:f998:de4e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:86:b0:3c3:704d:57c4
 with SMTP id adf61e73a8af0-3cd0121215amr16693141637.12.1787180599692; Wed, 19
 Aug 2026 16:03:19 -0700 (PDT)
Date: Wed, 19 Aug 2026 16:03:19 -0700
In-Reply-To: <5799b5d637f6b540c45874120aa37749a7dfb955.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260819094903.3060020-1-xiaoyao.li@intel.com> <5799b5d637f6b540c45874120aa37749a7dfb955.camel@intel.com>
Message-ID: <aoY2N1mpG-IQIUDm@google.com>
Subject: Re: [PATCH v4 0/9] KVM: TDX: Enable VM-DoS Prevention Features for TDX
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "kas@kernel.org" <kas@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"nik.borisov@suse.com" <nik.borisov@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026, Rick P Edgecombe wrote:
> On Wed, 2026-08-19 at 17:48 +0800, Xiaoyao Li wrote:
> > Patch 6 itself is a fix for VMX and is OK for cc stable though maybe no=
t
> > necessary.=C2=A0 Patch 6 is added to this series since it can help stop=
 Sashiko
> > repeating its finding of VMX's pre-existing issue, and it's also necess=
ary
> > for patch 9 to consilidate the exit handler for VMX and TDX.
>=20
> To me this is not a valid reason. Sashiko is great, but we can't let fals=
e
> positives drive the patches. Given that the series is so big now, I'd thi=
nk it
> would be better to leave 6 and 9 for follow up, so we can focus on the co=
re
> thing.

Hmm, I disagree.  If the consolidation weren't here, I'd absolutely ask for=
 it.
This is new feature enabling.  Yeah, it happens to be tagged for stable, bu=
t at
the end of the day, it's new feature enabling.  And it's standard operation
procedure to do cleanups and dedup code as part of new feature enabling.

If anything patch 6 should be patch 1, but that's a minor detail I can sort=
 out
when applying (assuming another version isn't required).
