Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE1047F4A
	for <linux-coco@lists.linux.dev>; Tue, 24 Jun 2025 21:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750799973; cv=none; b=NZy+9QpF29TkxBoVqwvJi7mqetUB4YEHZPOrQ0TiMxfH1FpBjvUWleJeKXi3WPmkrvgucr/Iw6GA5m3UOKNYp9TpP0HugrdlOvy8RKk7ddBdcrbk9PlDRGdfvLCK5nCX93jyJniwt+5gAmBXquIezYQu0OLr+/lrWKa7jE4l2p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750799973; c=relaxed/simple;
	bh=rkg2kaUVfDpXnMWfNfMpOIO++r1U3f/vQMPj3QDan5I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZzVUZkuUQFrZ0TxTwUq7jeqTg7DIEqVsi+KUDEuD5H/s++o8+SsixgT7nyJQgfjHqgXKBWMtx87MAd29IzD7Pj+inrErYx4K+gkC4yHogMhah1j8nzNit4zzlhXAxAc19CuO/+BN5JK14ZIxWamy752hnUI+g6+MUCGsJLcIzys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aFIKxTAt; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aFIKxTAt"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2350fc2591dso3388105ad.1
        for <linux-coco@lists.linux.dev>; Tue, 24 Jun 2025 14:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750799971; x=1751404771; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/DKdrxxxxgfubm4gUGyuBEi54YGGesYa+IdSB/NKih0=;
        b=aFIKxTAtthNoaB91fidPHhEMjKpOExCyITxEKpVxmeGxVl0yi2HP78s+e+5AoFp0tk
         C9BC6b6X11qbELWYvP/5lV3uXS9svzvBhBaMN/25iWAXko5GaZiru4IhenRVCuw48IOm
         /0k63em1qlcZNYkJ+m4TiYsmxzO5vz5QJwsp8tNwcA8z4cgrpPXD2uId0lJflJcPnGV4
         3k23aCeqAI1GgYvJxW4l0TJzQASZKMU42JP7UyiN+8enPgQloONqG281e8UF42ynojiF
         aMa3Nsk6jTBTZIKNXYFQrGKqmXaVzDYNyQdVw3ZyUqmnqguhVIqZbHuWDEmPMQnzmQK+
         TGcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750799971; x=1751404771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/DKdrxxxxgfubm4gUGyuBEi54YGGesYa+IdSB/NKih0=;
        b=TqQXSg1knMVe3Rsx5/HF/woZrRO+RFNtK6VEgbEN8s6gJc08jwbXEhV8upgsi9p+8r
         5SzySxJACjGwGrjOWPU2ZboVfwNOiu/MouRqPFGm8C18FIUfi2SoCtD9bz2gY1tMZwbu
         0ZNtV/Y5vaMhfB7EwSS1yF0dgJZ/wP/CTSYhIFINwD/SLk44bhB03Puc56pCL3qLpoGQ
         kJMXisOigGFixmDCaYRzF4gl3a1osys7E8jClXLWuPGZ+qIINbaFODJVCByt6IB52iCq
         Qp7aZPOlopggSVPtolCajkKjT4/lQap7FpE9m4pO/mdUJ66aj+NYyz8jxegXYQwzqOTJ
         cPXw==
X-Forwarded-Encrypted: i=1; AJvYcCWXrUaRxLP4nFgO8NUmOSMNn8qi3n5XiKmCo1aw0Zdf6bZ6Gxj8hfYkVr2Od5jLrn4KCDAy2NCtPNcG@lists.linux.dev
X-Gm-Message-State: AOJu0YyVJ7YRprLWkt3n4xT0crZ1ktaj1oVOtlVzQrygz1cqFEcZBLdb
	x83i28eDlXXyHM57F+8RFtRaZfpm71onEPSoyUzcuaMVy26AQ9jUK05jNwJoDzVbWIjww6BDzyh
	yCG9Ms7wuG+3uwg1fA+Oj5rLecp24/5Pg0bUY5JX/
X-Gm-Gg: ASbGncvW9iurtwNM256QzD4gfAegDnniYeTQQqKWWN0jNt3mUXauwPvp3gM0u62XV40
	wa1NaazaxWCR59JjsX7FbqEhS9u/IrTRq3gVhN3CEwEjgoPPl27g6Q7KQnQvIdZ8OpGRoOMzKYt
	oVV95JGrK6JRgqT1WL31DMxON5svkH2ul55Cg4lUu0oHE=
X-Google-Smtp-Source: AGHT+IEhYH86CN14DfAXCmyTagMdKdnrbqFT1tk9ZDfw0ZkstL/OOMdw178+AAia+uoyd2CpBQp2zv+5rTqk89mZPNQ=
X-Received: by 2002:a17:902:db05:b0:235:f059:17de with SMTP id
 d9443c01a7336-23802497032mr79048815ad.15.1750799970731; Tue, 24 Jun 2025
 14:19:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <87frifm75c.fsf@redhat.com> <CABayD+eRjjknqJNRkkh9_KraC-jZyXb1BL_D79m04po1_hR-_g@mail.gmail.com>
 <CAAH4kHbCduQr_+oj0X8QeTjgDgh6aBncPV-1+mvB_r1R3i7Lqg@mail.gmail.com>
 <3d9fa17e-2b74-4c90-99b8-5b1dc8d15356@linux.intel.com> <100D7ECF-1292-450A-9F65-FEBA5843AB99@redhat.com>
 <7c650817-09d9-4c41-96db-62c0950d71d5@amazon.com> <0E0BB5C5-457F-49B3-A61D-98BCD10CC430@redhat.com>
 <95a3e3ca-4fba-411c-b979-4dc8ecc1f902@amazon.com> <64D33153-BCA6-4971-97A7-110504B4AAA3@redhat.com>
 <CAAH4kHZUMP6it5jwnNv6XdC9NFzj3qAi1DmCTmajTDTYm1NYZA@mail.gmail.com> <loxvc232xwxgndtgyh6rp4rw3uumvuvtwrlvcatrj63tsyhlrz@bp7bjcqrywwn>
In-Reply-To: <loxvc232xwxgndtgyh6rp4rw3uumvuvtwrlvcatrj63tsyhlrz@bp7bjcqrywwn>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Tue, 24 Jun 2025 14:19:17 -0700
X-Gm-Features: AX0GCFv5vmE0lB47nkSRGbPbIfdbMd07L808dsML_Phi1eLGoKVVT-y30uBKmKM
Message-ID: <CAAH4kHaO6ig_UQ8m7isiHrQ9rz7dahk6zezCdOJZMUmHjKuGAA@mail.gmail.com>
Subject: Re: Linux kernel SIG meeting for vwfwupdate discussion
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Ani Sinha <anisinha@redhat.com>, Alexander Graf <graf@amazon.com>, 
	Dan Middleton <dan.middleton@linux.intel.com>, Steve Rutherford <srutherford@google.com>, 
	linux-coco@lists.linux.dev, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Joerg Roedel <jroedel@suse.de>, Jon Lange <jlange@microsoft.com>, 
	"cho@microsoft.com" <cho@microsoft.com>, James Bottomley <James.Bottomley@hansenpartnership.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 5:18=E2=80=AFAM Gerd Hoffmann <kraxel@redhat.com> w=
rote:
>
> Well.  That assumes that the VMM host can access guest storage.  Which
> is according to alex not possible with aws nitro, and also for qemu this
> is not guaranteed (although it is possible in many typical
> configurations).

I understand. It's not out of the box particularly easy to get as a
VMM feature in Vanadium either, but most things are possible with
software changes. You just have to be willing to support that use
case.

>
> So, with that in mind the envisioned workflow for the FUKI boot is this:
>
>  (1) first stage boots, firmware loads guest application from disk
>      and runs it.  The application is expected to typically be a linux
>      UKI, with either the firmware embedded, or loaded via systemd-stub
>      add-on.
>
>  (2) The systemd stub (the code which runs first when loading an UKI)
>      will figure whenever a firmware update is needed.  If so it will
>      invoke the firmware update process, otherwise launch the linux
>      kernel.
>
>  (3) The firmware update will pass both the firmware (as igvm file) and
>      the UKI (efi binary) to the hypervisor for the second stage launch.
>      For passing the UKI there are multiple options:
>        (a) original design idea is to simply pass on all memory pages in
>            'shared' state from stage1 to stage2, so the guest can use
>            that to pass the UKI to the next stage.
>        (b) alternatively the firmware igvm could be modified on-the-fly
>            to carry both firmware and UKI.  See also
>            https://github.com/microsoft/igvm/issues/91
>
>  (4) hypervisor re-creates the sev-snp context and launches the igvm
>      file passed from the guest.  The second stage firmware can go
>      launch the UKI passed from stage1 directly, there is no need to
>      go though storage/network setup again, which should speed up the
>      second stage launch.  IIRC that detail was not mentioned/discussed
>      in the call last month.
>
> The vmfwupdate device has been designed to solve the "pass firmware and
> UKI from stage1 to stage2" problem.
>
> There are a number of options we can consider moving forward:
>
>  (a) Instead of making the vmfwupdate device the common API we could
>      create an EFI protocol instead.

I would love this to be standardized so that the IGVM specification
can fall under the UEFI forum's governance.
Jon said the CCC was inappropriate as an owner, so what about the UEFI foru=
m?
This would match the FAT32 spec snapshotting that the spec did for the ESP =
FS.

The upgradable format would lag behind the launchable format due to
the specification and publication cycle
of the forum, but it would be a good place for better discussion of
cross-platform issues.

It allows Intel to better shift their TDVF launch instructions out of
GUID table parsing and into a shared
format. It would protect the IP risk of depending on a Microsoft-owned
format=E2=80=94as well-intentioned the inventors
are as professionals, there's always the risk of higher forces
asserting ownership rights for unpopular changes.
Google approved collaboration on the IGVM repository not without hesitation=
.

>      So the vmfwupdate device would
>      effectively become an implementation detail for (probably) qemu and
>      aws, and GCE + Azure can choose to do something else instead, for
>      example store the igvm on some standard location on guest disk
>      where their hypervisor can find it.

If the protocol implementation writes to the volume as part of its
implementation, the location doesn't need to be standard, right?
Certainly I would prefer the location be standard so that any update
to the location outside of the EFI protocol has the same behavior on
all platforms,
but that won't be the same behavior for platforms that don't
communicate with the disk at all. Hmm

>
>  (b) Caching.  Allow the hypervisor to cache the initial state for the
>      second launch, so going through the whole process is needed only
>      after firmware and/or kernel updates.  With that added the guest
>      obviously needs some way to invalidate the cache.

I imagine you mean device state and just swap out the VM context. I
thought that was already the plan. The main issue is the VM context
launch cost itself, which is multiple seconds, which is not great for
VM creation performance.

>
> take care,
>   Gerd
>
--
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
