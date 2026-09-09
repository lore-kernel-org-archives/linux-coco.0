Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7091A35F19D
	for <linux-coco@lists.linux.dev>; Wed,  9 Sep 2026 17:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788973965; cv=none; b=oVXpyKAMUSJWsQTONduh+w65Hx6hwJZu1CZlwhIooKRtxvRh59LGed+k7v9kXjJaALdSHPeU+EMuZvpIRsM6V957eRyTMAcMGKKhtjX5iElNyyFyQxZyquKHZQ9iCLaA4kgsVtmhcS6rL76rkXFiaML8aZoP6ekTFHVGgHPwGa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788973965; c=relaxed/simple;
	bh=9o4o22e82xeRV4/C50H+nCGHWlKygWlRszvQ/fhXfCE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SlR0tFCTubEoWjShx8Y1Dt5fl498opKqfjAW+rnWGNz6umEYQC1qXHXI1bE6lyXeCjYOvKBsgIt20BHRZRjMUp7abW6ahkPbJAmXZ3hIeC7bYilKenrNgchvT4fyCsfVPhtFX7J9JSO77c6FScHyG+mPJhd0Xq88faN9br0vIvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fbUIzdHs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fbUIzdHs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788973962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mEQXR8PSW2iE6aOhl0o/YMVFqT7ViqqXgU8XSWBw99s=;
	b=fbUIzdHsVHiGJ7K2mwzDm4QGhfJEHDWaqv811vJ/O0kSHMM6IvKa0Ta17pQVhjdp12YZOf
	OuIF3MLRIC6UfZxLY1QaYG/Zcu/Ko/pnreyhWOmZVuBv+wtNEHEr9zGYnJxIGS2f7ExR2y
	xmZTnMcRpvmeUnEUCKykKdx7t0WL/qg=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-277-YRsHY8I2N1ewl28SQlhaiQ-1; Wed, 09 Sep 2026 13:12:40 -0400
X-MC-Unique: YRsHY8I2N1ewl28SQlhaiQ-1
X-Mimecast-MFC-AGG-ID: YRsHY8I2N1ewl28SQlhaiQ_1788973960
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84a67b16217so5090891b3a.3
        for <linux-coco@lists.linux.dev>; Wed, 09 Sep 2026 10:12:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788973960; x=1789578760;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mEQXR8PSW2iE6aOhl0o/YMVFqT7ViqqXgU8XSWBw99s=;
        b=MMsCE9q2ugbKcSIKji7EnlVzvlub+A4rwMk2FDHlakJ1qzjAHGlNMujTkaB6J/zOGq
         ugGlf3t85+K8F6p4+F4MZHFewvZ2deLFhNdbFGMUW//4JqUEeW3IjMPNjpPQFA+F3xh7
         FgUP7zEHgfXFc2a+s92h0sMAScFDFksOcJjzB/r8rviaS80OX6//iCf38/P4noZM0f0g
         rbf1o1Amnc+068qXwQ9AEeKaDi0Y0GZLeDnPC8smgE94M8bmb43NJ7Y+mcJvoQVmoOH4
         q431hHHH5/U2GIJIDMZfYNINy2b8T3OSxH/OICDERx5gD1R5Gl7Pg/Z2jq8tIsHzgGam
         4SGA==
X-Forwarded-Encrypted: i=1; AKwUvBwbUjhiWd2Ke6T58aq1a+Iu6GPGOumwp71M0bDrwJ3CND72mNo65NE/eCdcO79IZRXO7zU5sYQtEprP@lists.linux.dev
X-Gm-Message-State: AFuF++nvgY8PoKSmI88ps6C7lMg4xJ4LiRY+j5Y+vlA92pCl80ipG0BR
	r4zeZua46uXI7edbyS/iYW3nq7UmrJjOLmi0vzFnqarRMUu7Fg2wWjdnA74ofu5fPZlqSGmY7SU
	oJYmD1yG32oEq+JKjCYf8jvo+ALpRoArfxReyKenU2/1FiTSg3ze7oOCjDIgin7s6lvHXvdd7sd
	fExBT1eJChH8t/QNFNVwXnhJRF8VIJQceJ/IZ/TsSEUzK1ikrs
X-Gm-Gg: AYBFou0rAfPU3Axw/s/m3oXMoap1bqFwEZbOshNmf4LlOI1fwQhKyzlvBaS+7Yb8aIn
	l336TXPFKD0d/3GU/lVFGqK1ZQDfKx9IPhM0Wv/g4ndbl5ahOT8u0xliNUy8FiWTJYK6HgWlW6K
	YOpbPlK1o1TW9TDPGJlyjQmcWedkWRMhmO+mrBP8+PJBSBPNu0q42bFQ==
X-Received: by 2002:a05:6a00:349a:b0:848:56ff:6ced with SMTP id d2e1a72fcca58-8616819d66fmr53020086b3a.8.1788973959452;
        Wed, 09 Sep 2026 10:12:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:349a:b0:848:56ff:6ced with SMTP id
 d2e1a72fcca58-8616819d66fmr53019969b3a.8.1788973958567; Wed, 09 Sep 2026
 10:12:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <apBelv6Ev-lCQ64J@8bytes.org>
In-Reply-To: <apBelv6Ev-lCQ64J@8bytes.org>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Wed, 9 Sep 2026 19:12:27 +0200
X-Gm-Features: AcwNN1UUyUote_j9E23jQccZzgZ2RDyc0Q2FPjbhM-jeZb4yprO6y362-qLFDLY
Message-ID: <CAGxU2F5nDauu+RyS4AA+NWVY=cjQVG5Ry0CmftYBUeFqU8GC-Q@mail.gmail.com>
Subject: Re: SVSM: Updated Linux and QEMU branches available for testing
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
Cc: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: embvWsfxmmxskyzUr6u-4RPkDda4uObRH1S5Hihu55E_1788973960
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 27 Aug 2026 at 18:24, J=C3=B6rg R=C3=B6del <joro@8bytes.org> wrote:
>
> Hi,
>
> I just pushed out new branches for COCONUT-SVSMs downstream Linux and QEM=
U
> changes. The new branches need to be used together, as there have been re=
bases
> which changed parts of the user-space interface. For Linux the branch is:
>
>         https://github.com/coconut-svsm/linux/tree/svsm-v7.2
>
> For QEMU:
>
>         https://github.com/coconut-svsm/qemu/tree/svsm-v7.2
>
> These new branches bring a set of changes and new features:
>
>         - KVM planes patches rebased to v7.2
>
>         - QEMU patches rewritten on v11.1.0
>
>         - Support for KVM planes with in-kernel IOAPIC/PIC/PIT/RTC
>
>         - Support for PCI device assignment with KVM planes
>
>         - Use of version 2 of the direct-VMSA patch-set
>
> The last point deserves closer attention, as it will lead to a breaking c=
hange
> going forward. The new version of the direct-VMSA patch-set requires a va=
lid
> VMSA GPA to be passed to KVM. The currently used GPA (0xFFFF_FFFF_F000) i=
s NOT
> a valid GPA.
>
> For now QEMU will fall back to legacy behavior when it finds an invalid G=
PA in
> the IGVM file, so everything keeps booting as ususal, except that the lau=
nch
> measurement will not match anymore.
>
> This can be easily fixed in the SVSM and I have a draft-PR open for that:
>
>         https://github.com/coconut-svsm/svsm/pull/1209
>
> This PR moves the VMSA page into guest memory for QEMU, just like it is o=
n
> Hyper-V. The problem with that PR is that is breaks all existing Linux/QE=
MU
> combinations, as they all have strict checks for the VMSA GPA to be a
> 0xFFFF_FFFF_F000.
>
> My plan forward here is to switch to the new 7.2-based branches after eve=
ryone
> had enough time to test them. After switching there will be even more tim=
e for
> everyone else to switch over to the new downstream code. And only after t=
hat we
> will merge PR #1209.

I just tested everything and enabling `attest` without #1209 it fails
as expected with a launch measurement mismatch.

With #1209 everything works, just a note, using `igvmmeasure
--check-kvm` fails, not sure if we should fix it as well in that PR:

$ igvmmeasure --check-kvm $SVSM/bin/coconut-qemu.igvm measure -b
Error: The GPA for the VMSA (0x0000000008FFF000) does not match the
address hardcoded in KVM. KVM will always populate the VMSA at GPA
0xFFFFFFFFF000. The IGVM file must set the GPA for the VMSA to this
address.

BTW skipping the check, it worked well (I was following
https://github.com/coconut-svsm/svsm/blob/main/Documentation/docs/developer=
/RELEASE-TESTPLAN.md#start-the-kbs-test-server)

Other than that, everything is working fine here.

Thanks,
Stefano

