Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F994A33
	for <linux-coco@lists.linux.dev>; Sat, 13 Apr 2024 09:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713001031; cv=none; b=DICz25kaaRnpsi/K5OK119DUCETvPHltztRxYvaRbdsAYJT4OtvgMVko7POba4DBjbi5y4fxFZA/JzV954FD4eOFVLSN/TlqPIxt70pbsbv0fhaoKwiOMJEiDLoGmZUkQ1N+4cQ5sptQFaqs0gySQ7l9sT1VJLQwz1NtjFmAkMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713001031; c=relaxed/simple;
	bh=oErCdTasF7hv9fXBCxAH6miASvfHakI/7pAV7fsDIYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I6ngASk9nWhgPwgMjH5BWjhIB6vjQ17GKEITC3dMN8LFfZE5kb/CdeyvmTmJDIj+Wg/QIaWgCzHI+zgMsjeZNAaUnNuw6I0diNcke4Q6qogGbZVhe+18UfoYyPWVHBGHQ61YKjxS5CD4UmSSZbePSyX2W9yyiDmRMUH/i0ltVZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QDGTCtaI; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QDGTCtaI"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-41699bbfb91so26995e9.0
        for <linux-coco@lists.linux.dev>; Sat, 13 Apr 2024 02:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713001028; x=1713605828; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mb0cGnRlNEkqOZzA5+KN1D2mlc1t+ivqPoTfdz+X3Yk=;
        b=QDGTCtaI0YawEtz633vjvFLd3U6b1Mvmkk84/1NsLzfd4lBX5bMjJ7XfIDfyvplumO
         A214ydM+QlgQDYBd3avzwMH9x/H55DXslg+JyosmL+ag7PyfCrrQfWm752ambmJgfP5x
         TSCG+ZOePymHutXj1CPumHUrlA5pqWWkZEs52ddUZvZKGAbWfha3xmw3xMRL4tLDxDbN
         D1FuZvsKlxHZNj0wOPefy2M5qf0hXjdLY/gshAHMCrrHPeSfqnCoAOG23g410db0uzwz
         q/tOTNuwlYPWdL9x7GiiAoJ02jEf6ZcdljfuWO+dqHRATanvjbKIyA91UDc2z9OBZEw7
         XAuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713001028; x=1713605828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mb0cGnRlNEkqOZzA5+KN1D2mlc1t+ivqPoTfdz+X3Yk=;
        b=b+rR/lDoYTwvkns8IKgNovnM+eIPpeHQWrErOoTe0ZsqKcWPF6VBl4INLoVkdK3ogX
         mDvYCe7dLnzlegKu/ABezHrY1k1iw6wEgaBk92pLsMxj/I6iJxsavP9N8Q6VFgMkDFt7
         nwffU4DfptCfTwSF0HMl8JXLqh+k0uw8q20X4ZZYmPUaKAbq2Vlqgi/NoXNguBznbPvj
         29NYPbbeqCQUwwfFw8yXgFvSCa63AStky+FI306FUWY+H/mlYzk+Iw9OOuPAthdaf0S8
         w5elihsThQ3q8farJ/pmyssRydskiOyFHoFtFgGDV2B/TJSuL6F1phBW9zYa1zNvgo20
         iQ/A==
X-Forwarded-Encrypted: i=1; AJvYcCWSw8mNAYxH41nyrNO+fXo+jfxu/GAcdnZNsB8OPnqZkiKY0pfZYNysKK0hZXQxQEzVnAAuu55cYunjxe7pHNwSDEs/KXHfCwQTWw==
X-Gm-Message-State: AOJu0YzYUkafgFs1LljK7epK1xkaaguB7MY2b18t3ikjhcUXkoRVJK1q
	8c/8A6xvFxXlgZ6NuhyL+9tFtqM0DXpNqWbEy4r5f/1M9QZqdfr3Goa1uItFo39qAFHqFPVJScc
	zmIUIzCwlEpa5uE8nKNWf1IHtBJzp8M5EKgXO
X-Google-Smtp-Source: AGHT+IHjYfY12OJgL/Vp71SvbVWmwj6vslJbyKiG9vfzmqYf34SWhnl77PDlvujuhycWNqrTkW1ER4uBLOpbtyQAaRI=
X-Received: by 2002:a05:600c:45cb:b0:416:7385:b675 with SMTP id
 s11-20020a05600c45cb00b004167385b675mr72884wmo.7.1713001027409; Sat, 13 Apr
 2024 02:37:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <94521f20aa2872c1b8f018b7db31eca4a2b8222d.1711039409.git.qinkun@google.com>
 <CAAH4kHbAi=Jn7Lw82idGGmQYnAhJnhoS9u8wBMOZsp7iLiOWxw@mail.gmail.com>
 <PH0PR11MB587959168F72B20E0AC836438C312@PH0PR11MB5879.namprd11.prod.outlook.com>
 <u76teout4bwpg5yoklah6xfkrpcn4lw5nosw5lmph7sfjipqnz@gagzyh3xrkie>
 <CAAH4kHbeGborxwDOzxeMbTjU4Xo79v-OVSHXYWQiJxg-yWQfWQ@mail.gmail.com>
 <ZgF3ACjFj8LtUWgv@himmelriiki> <CAAH4kHbqpaCgZJpF55x2NGWL22rz1ucRewYmR=K2chw2kP6sKA@mail.gmail.com>
 <MW4PR11MB5872BBA0D379C40E071300B98C052@MW4PR11MB5872.namprd11.prod.outlook.com>
 <CAMj1kXGm5RPNAzshaTAb7fnB80m8S+q0gbNxWSA3i9Dp-AL8uw@mail.gmail.com>
In-Reply-To: <CAMj1kXGm5RPNAzshaTAb7fnB80m8S+q0gbNxWSA3i9Dp-AL8uw@mail.gmail.com>
From: Qinkun Bao <qinkun@google.com>
Date: Fri, 12 Apr 2024 23:36:55 -1000
Message-ID: <CAOjUGWckeov-K45R1Mf=MvEYG7vDetrUh-ifQwZDTLMEVEmhpA@mail.gmail.com>
Subject: Re: [edk2-devel] [RFC PATCH] OvmfPkg/SecurityPkg: Add build option
 for coexistance of vTPM and RTMR.
To: Ard Biesheuvel <ardb@kernel.org>
Cc: devel@edk2.groups.io, jiewen.yao@intel.com, 
	Dionna Amalie Glaze <dionnaglaze@google.com>, Mikko Ylinen <mikko.ylinen@linux.intel.com>, 
	Gerd Hoffmann <kraxel@redhat.com>, James Bottomley <jejb@linux.ibm.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Michael Roth <michael.roth@amd.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "Aktas, Erdem" <erdemaktas@google.com>, 
	Peter Gonda <pgonda@google.com>, "Johnson, Simon P" <simon.p.johnson@intel.com>, 
	"Xiang, Qinglan" <qinglan.xiang@intel.com>, Cfir Cohen <cfir@google.com>, 
	"Madhanagopal, Ranga" <ranga.madhanagopal@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

Thank you all for the feedback.

> > In Intel, we had discussed and we did see the potential security risk. =
As I mentioned in the first email, "In case that any the guest component on=
ly knows one of vTPM or RTMR, and only extends one of vTPM or RTMR, but the=
 other one only verifies the other, then the chain of trust is broken."
> >

Thank you for bringing it up. Unfortunately, it is the current status
even without this patch.
On a TDX VM with Grub boot:
TDVF, Shim, Grub extend their measurements into RTMR.
Shim, Grub extend their measurements into TPM.
We are seeking to add a non-default, build-time option that makes TDVF
also extend its measurement into TPM.

The measurement skew should not be a huge security concern.  Yes, some
environments won't be able to successfully attest. Again, we are
talking about TDX VMs. The security property of a TEE should be based
on the attestation results. The attestation verifier/service (e.g.,
Intel ITA) should examine the quote and check if the chain of trust is
broken. And the end user should only be trusting attestations that
contain full boot chains that are known to correctly measure every
step into the relevant device.


>
> I think it is a bad idea to go and apply changes all across the boot
> software ecosystem to measure the same assets into different
> measurement protocols. I'mm afraid it creates technical debt that will
> come and bite us in the future.

Could you shed some lights on why it creates technical debts?

>
> Given that RTMR is a proper subset of vTPM (modulo the PCR/RTMR index
> conversion), I feel that it should be the CoCo firmware's
> responsibility to either:
> - expose RTMR and not vTPM
> - expose vTPM, and duplicate each measurement into RTMR as they are taken
>
> However, I understand that this is only viable for execution under the
> UEFI boot services, and after that, the vTPM and RTMR are exposed in
> different ways to the OS.

Yes, they are exposed in different ways. In Linux, the TPM driver uses
the mmio interface rather than the EFI service. Even if
EFI_TCG2_PROTOCOL is not installed, the TPM as a device is still
visible to the guest. The RTMR values are included in the TD report
and could be extended through a TDCALL. The security concern caused by
not measuring into every device that is available is a concern. Please
see CVE-2021-42299.

>
> Could someone explain how that piece of the puzzle is supposed to
> work? Do we measure into RTMR after ExitBootServices()?

Yes, we still measure into RTMR after ExitBootServices() [1]. One
example is measuring container images into RTMR2 during the loading
[2].

Link:
[1] https://lore.kernel.org/lkml/20240128212532.2754325-1-sameo@rivosinc.co=
m/
[2] https://github.com/confidential-containers/guest-components/pull/467/
