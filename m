Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF514908C8
	for <linux-coco@lists.linux.dev>; Fri, 21 Aug 2026 13:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787318100; cv=none; b=aKvhQTyStTchxQ219EJ0VmjLNmn1oFnb4DHs0v0QL2Uwi6FRlf1oyMvW9YW152n/UWuzuGVr0vupQ4/Dbzm9OpiaswQTtHA3Y+ebtsrh8/mrMIoSqeB7d5crn03NQcboSdDR+j0wEm5HLbFNbibVvpTBHPiUOrPzDtNWbNs4IqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787318100; c=relaxed/simple;
	bh=ZgEtJfYhvEx3RUMYzu/QeOmFo1mnqj6uqfkRQxaKdyw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iJ/8VMhC4ztDYjWlqonUmoLZM4IrZObsBxn5yTXCZEj6sPSxbXg8PGLStfijrd9F6P6FcVGyEqw9mmRuyD7j+uxb9JIGdtmEq2iyKNt7KYEKHqDkrvl6scEzfaOsDoKH+6BxFn4p9zWt+ieKi0o7tNinKqBvef4NlFgkAeQ07nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hNf1WlH6; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hNf1WlH6"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccd1958e8fso15144775ad.2
        for <linux-coco@lists.linux.dev>; Fri, 21 Aug 2026 06:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787318092; x=1787922892; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xbkxU3KDRFhwwjU3XLpDILLbXwo99XWxcTGCF4UGzgI=;
        b=hNf1WlH6A9jGtsZaZ7QOkzTVfItUdCHghbqXSBEG7ZE7evISE5QTTJpTr2yenJsbZt
         bu39juC1gITwcSRm7CUfmU2TO/cryYC0vapAM2W2zK2F2ZxDygiR+HR4GMxYbsFPJhvS
         wsoFYBzGEDu8XktTtay6qljDVGZkP3+8u7CwFS9h1dYLtUxSY5/rNcm0EHA511oRSzop
         qOTZmasM4BFL6l1zOgORHSdRix2F2cYFC8wp9AenfR/OGCkSAn3fOUeLPligtS9bWr0/
         GuhI1XjbILflxsNIezntsExQuZx2CkuB1VKI6eDjlUDGbaBU472KSfVB7GkY+gEgoxvF
         GPxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787318092; x=1787922892;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xbkxU3KDRFhwwjU3XLpDILLbXwo99XWxcTGCF4UGzgI=;
        b=UIz7BxbeSQieeaPRX07oyqXMh8B4KLkZyD+U9besp/HZNAJsKqXWT7xA6OTWbQCIgZ
         RokdDPCpiX91oyrCo+4wjw6IUg+S0dcKfz7gGYuA30Q41e2nq5ykfpK+opeplDIaledA
         YDpIwIFdS8AR8psNnqg48/GywoCQxbA/nH6YA3Hz+e4r5T/1zW3Mh2qZz7WuOHb04Vf9
         GqM1P58d4NSdeXj56wWkGx0nvUIKR6M/NKFl8h8nQtJgCibGH0LeIhsgs8IruURdkaFi
         itiS7Fnxqul1DbERtOkMV829p3Qo+enP7Y/V+fVm3wFHVd11jpktMgHCYRIvHEKxMi8Z
         nBOA==
X-Forwarded-Encrypted: i=1; AHgh+RocWQgR0roketruOJeUOV9vec+BKYlxPHpXEqFPbswpRRqVrAHzQWhCxMgA/l9OzpvEpBpSTsij5ELu@lists.linux.dev
X-Gm-Message-State: AFuF++kOlpu2f1lLYHs3fUbipGVfCn++pJAx5A0YjqoY4h3dkBI34G50
	kOsfztbNev6UL633DCIpSnceaFenIxHdWk+Fm9LYziXqT2WaBiclCqQppK4kPDxnN5bTC8HgahB
	twuidXA==
X-Received: from plrf23.prod.google.com ([2002:a17:902:ab97:b0:2ca:b907:d842])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2c0c:b0:2d3:78c2:1f19
 with SMTP id d9443c01a7336-2d64b0270b8mr122535495ad.9.1787318092128; Fri, 21
 Aug 2026 06:14:52 -0700 (PDT)
Date: Fri, 21 Aug 2026 06:14:51 -0700
In-Reply-To: <8f715ebf5cb0ef70803ca8c6ad462d9de7dfa8be.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260819094903.3060020-1-xiaoyao.li@intel.com>
 <5799b5d637f6b540c45874120aa37749a7dfb955.camel@intel.com>
 <aoY2N1mpG-IQIUDm@google.com> <8f715ebf5cb0ef70803ca8c6ad462d9de7dfa8be.camel@intel.com>
Message-ID: <aohPS45Qc7erio4c@google.com>
Subject: Re: [PATCH v4 0/9] KVM: TDX: Enable VM-DoS Prevention Features for TDX
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "kas@kernel.org" <kas@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"nik.borisov@suse.com" <nik.borisov@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026, Rick P Edgecombe wrote:
> On Wed, 2026-08-19 at 16:03 -0700, Sean Christopherson wrote:
> > > To me this is not a valid reason. Sashiko is great, but we can't let =
false
> > > positives drive the patches. Given that the series is so big now, I'd=
 think
> > > it would be better to leave 6 and 9 for follow up, so we can focus on=
 the
> > > core thing.
> >=20
> > Hmm, I disagree.=C2=A0 If the consolidation weren't here, I'd absolutel=
y ask for
> > it. This is new feature enabling.=C2=A0 Yeah, it happens to be tagged f=
or stable,
> > but at the end of the day, it's new feature enabling.=C2=A0 And it's st=
andard
> > operation procedure to do cleanups and dedup code as part of new featur=
e
> > enabling.
> >=20
> > If anything patch 6 should be patch 1, but that's a minor detail I can =
sort
> > out when applying (assuming another version isn't required).
>=20
> Ok. But you disagree with dropping the patch?

Dropping the patch.

> Or that avoiding sashiko reports of existing issues is an invalid reason =
to
> change the series?
>=20
> I think it's good to discuss a bit how to handle sashiko scenarios.

Like we do any other code review: use common sense and follow established b=
est
practices.  If a human reviewer pointed out an existing bug, we would analy=
ze
the situation and make a judgment call as to whether it's better to send a
standalone fix or roll a fix into a new version of the series.  If we decid=
ed to
fix the issue separately, and then a human brought up the same pre-existing=
 issue
in a future revision, we would point them at the fix or the previous discus=
sion
(or if it was the same human, (politely?) tell them to go away).

The only differences is that Sashiko is noisier because is doesn't (yet?) r=
emember
what feedback it gave in the past, often doesn't look at the patches later =
in the
series, and doesn't (yet?) respond to emails so telling Sashiko to shut up =
about a
particular pre-existing issue isn't effective.

But to be very explicit: don't include a patch *purely* to suppress Sashiko=
's
rediscovery of existing issues.
