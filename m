Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2983E63B0
	for <linux-coco@lists.linux.dev>; Thu, 12 Mar 2026 18:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773340191; cv=none; b=iGQgUjEyyOR1QkskSynud9eAW475AZlPwC324EDl2jcgOYU/crWA6M9WfZapJmGeK4HPco3WeYOoeo4mTMNXELo0hKjbz0KQ9iaAE1DffLIW4BHbnJC/XmhCCfdi5cTZxEnrwfofiit0ccNX1k9JaFhrBH0lGrThUlBhR67oPOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773340191; c=relaxed/simple;
	bh=ZJ4I11P1rRBeHSfpG+I/A2zkE2tdQV3uTy0wBAdmlHY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DmDKpZnseo4mw2x3bm0qXELG++KL6HjGipj1qicx8xpIoznHu+BY+9s0PyZVYKE76VMgCUXEWgUVrdOElCh8772B88yetv6r0KmTVvX9wdU6NIDxY4roNtfv47fvpBUVM43zHYmNpian7cwVe2KHDDvUCMhjOK4pBhH1Wr/swIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=otb7SIfg; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="otb7SIfg"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2ae59e057f1so17359375ad.1
        for <linux-coco@lists.linux.dev>; Thu, 12 Mar 2026 11:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773340190; x=1773944990; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X5OTYERPzegYtQwRPBPu0VS5xjQRDHb8V88deRQ7mWM=;
        b=otb7SIfgi4vrmGAW6wP/gytPkhhPsd5MHqrubWiRufqomUq8havNJnpZKQ2Ku8bliD
         y2HcBohGI4LjsI5rUZQI5ico9By+enyVWSnv38Q+vzqiC/LNPYE+plwMnLQasgsmyHrg
         pTNUad8D0lKv9JXegjhZ4fi8fUf2fVBF4lgbIPMaFhdGWHXjZRmppjmDZP3LrRPOfis9
         DT0yeYS6vp+PWuoQxNBk1xRbiWtQJPHBmB7VNdQ7V/vRXrKDhWfoIUCF9kF83UpmxRey
         cte8ID1eKyQC9vE+1qTZ/XqF/YqwwE9VrBQ2k8OJLyX8j/hbhH6IgEN9pqSV21Papdqe
         Zobw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773340190; x=1773944990;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=X5OTYERPzegYtQwRPBPu0VS5xjQRDHb8V88deRQ7mWM=;
        b=tkyph7oj5YkZwHSmuApNmUr9e3YjDkC9F1IjqG8pSyN6ebtXNqL4KuHRtnnmMalg3i
         3yEoQBIHFhfXJepFFwrk4+mIZeFoLrlEYHVetuEqh00MePF/++Ma/5kV5BzqZ0Al1Z9N
         9NeN1muvLS5Z2puxwSOeVt5VCzsDTa1caT8vpzZI+eujKhEvjje3lczPx1HimgtrXzW0
         +H3q/2kioiPRkOpeL5WHVCJWrUj10d3pJsqwQLQRuM86tZkfRXC2C0E5qDFw3ePaIrE5
         Fr/PPJqw3q46ogBzJnfFYH8lpTtqBCZsO0YYcM9OdBq0jNRRt1MdsWp6DAikkEdnxsC1
         GBFg==
X-Forwarded-Encrypted: i=1; AJvYcCUZh0QA/PizRDPj9HWNQ+04whMS3F5iCx6nld4B4HQkMVPoHkHzBaTeDpJ/RiFFFKs8ky951KW04v71@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2NG2EmvIQD6LI/k14JAFtfn4zqPps3TP2saMUeGCbxIQazfAl
	nIna8/CiCjJaXLAJE2uYHy1pMDcy6oZZOCPZdHuQ6O6mRv2YSo7rnq17+ebqxWjPsToUTVw2Swj
	ThJO7Lg==
X-Received: from plbkv16.prod.google.com ([2002:a17:903:28d0:b0:2ae:a2f6:cc35])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:41cb:b0:2ad:da28:98d
 with SMTP id d9443c01a7336-2aecaaf546emr4752605ad.37.1773340189875; Thu, 12
 Mar 2026 11:29:49 -0700 (PDT)
Date: Thu, 12 Mar 2026 11:29:48 -0700
In-Reply-To: <e76107e3-b93a-4154-859f-d22de0ee6f78@citrix.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <abL8SW5JS1aV5goa@google.com> <e76107e3-b93a-4154-859f-d22de0ee6f78@citrix.com>
Message-ID: <abMGHGMTfz-qaPxI@google.com>
Subject: Re: [PATCH 0/7] KVM: x86: APX reg prep work
From: Sean Christopherson <seanjc@google.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: chang.seok.bae@intel.com, kas@kernel.org, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, pbonzini@redhat.com, 
	x86@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2026, Andrew Cooper wrote:
> > Have you measured performance/latency overhead if KVM goes straight to =
context
> > switching R16-R31 at entry/exit?  With PUSH2/POP2, it's "only" 8 more i=
nstructions
> > on each side.
> >
> > If the overhead is in the noise, I'd be very strongly inclined to say K=
VM should
> > swap at entry/exit regardless of kernel behavior so that we don't have =
to special
> > case accesses on the back end.
>=20
> I tried raising this point at plumbers but I don't think it came through
> well.
>=20
> You can't unconditionally use PUSH2/POP2 in the VMExit, because at that
> point in time it's the guest's XCR0 in context.=C2=A0 If the guest has AP=
X
> disabled, PUSH2 in the VMExit path will #UD.

Oh good gravy, so that's what the spec means by "inherited XCR0-sensitivity=
".

> You either need two VMExit handlers, one APX and one non-APX and choose
> based on the guest XCR0 value, or you need a branch prior to regaining
> speculative safety, or you need to save/restore XCR0 as the first
> action.=C2=A0 It's horrible any way you look at it.

Yeah, no kidding.  And now that KVM loads host XCR0 outside of the fastpath=
,
moving it back in just to load APX registers and take on all that complexit=
y
makes zero sense.

> I've asked both Intel and AMD for changes to VT-x/SVM to have a proper
> host/guest split of XCR0 which hardware manages on entry/exit.=C2=A0 It's=
 the
> only viable option in my opinion, but it's still an unknown period of
> time away and not going to exist in the first APX-capable hardware.

+1, especially hardware already swaps XCR0 for SEV-ES+ guests.

Thanks Andy!
