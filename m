Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DAB762C9
	for <linux-coco@lists.linux.dev>; Mon, 15 Apr 2024 14:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713192157; cv=none; b=CxbZi5LJ98WF1gnJmKstAnOYnJI3Y3yAPpJWI49/DrpLAlXwH3YfiyGn8GjafGs/cDca0U4e17aoWhgU+XkzGm1fP+a+PeHYYs53P458+JDQnX5xFnVpp12o0Gy4YfuckxFlh6uToNXFtuMkKhwnTVzDNCTE6vpF9pSbh3znrCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713192157; c=relaxed/simple;
	bh=jtpF0oWJ78OXdBwHokeg6uJX/abNlnNrtUA3wlmFgkg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MDJ79Oe2lu1D70GI2faJyb/N2ccV6Ow3lMebOza7ZQsJKBYnL3XYwrzjiPUO3bF7GAKJxGHjj9Uvb/FoxdXd7GHqarPDPpRN1V0+jJ2hGlv1Ul8xiudTno86u2CLAa5oHUhSwWWh5xnqD+uCAXyHIAZYGqhHmkSJVw1ndNlM2R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iIEuGK0h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iIEuGK0h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09137C113CC
	for <linux-coco@lists.linux.dev>; Mon, 15 Apr 2024 14:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713192157;
	bh=jtpF0oWJ78OXdBwHokeg6uJX/abNlnNrtUA3wlmFgkg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iIEuGK0he2d4AtcAtSwcJA+e7ggfnpgwYqIZWu8/REMtzkFY1+9ClPE4GBMvkdAjk
	 d147odESONJfhA3KoWbQZRIJ46hge813lXinw/1XRssaZuNUznHZbYTCEirn8W6TrB
	 19g/S6gqpcRPGoowhsAlthreu3So5fjQj2/MNMdrPj554GPtLaB8F91nAPca/IiA/l
	 qDzNKb3m5IvkLEbrDJA6qYJnRsUD+kW8vKvrXlb4AmCPf1WZLTeJL6j1TwBbiHNQlN
	 oAIbfPRX9dWKe1J8nHtGwtkCPcOSVWgQALl+MPeXU7E4WG9iGDUbGXaitIWw0sgQ5K
	 ybEoMQr/MQa+A==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-518e5a74702so690195e87.1
        for <linux-coco@lists.linux.dev>; Mon, 15 Apr 2024 07:42:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVlJe0yAJJm1rRcv4ok/YLc76/c4YnLqBvAKVRTHxwlDF48BD9efMuwgL56OdwjaVAwhgIqNgNrSlU+QACisxtwICwlfcshb00mkQ==
X-Gm-Message-State: AOJu0YwUW+QuEjrbiLZny35pSVFCvUZ7fkxa0OosfbQrPK2G1GB8Nxkw
	1BINZIk7ag93bHD89fcuTckF7W0h//4TPVbnmoE7NT5Db+yAU5rwCnbCnLdgAjtlZY23xSnL31d
	RglWvBRZIo+lswjTw+pT6XGGeQpY=
X-Google-Smtp-Source: AGHT+IF+/5AXxrZyIZ0w3+GlcRqRzaGxJ6MW6BTytHxiQXM3Qhl0B0tR5Bpsv76OONgPhjKSCQOitahz/pOf92VMC6w=
X-Received: by 2002:a05:651c:2209:b0:2da:6ca:bddb with SMTP id
 y9-20020a05651c220900b002da06cabddbmr3506689ljq.19.1713192155412; Mon, 15 Apr
 2024 07:42:35 -0700 (PDT)
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
 <CAMj1kXGm5RPNAzshaTAb7fnB80m8S+q0gbNxWSA3i9Dp-AL8uw@mail.gmail.com> <CAOjUGWckeov-K45R1Mf=MvEYG7vDetrUh-ifQwZDTLMEVEmhpA@mail.gmail.com>
In-Reply-To: <CAOjUGWckeov-K45R1Mf=MvEYG7vDetrUh-ifQwZDTLMEVEmhpA@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 15 Apr 2024 16:42:24 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHoFyy2T0TxgPMOVxGujCwbCVXBw-z+AcCydProwMGOcw@mail.gmail.com>
Message-ID: <CAMj1kXHoFyy2T0TxgPMOVxGujCwbCVXBw-z+AcCydProwMGOcw@mail.gmail.com>
Subject: Re: [edk2-devel] [RFC PATCH] OvmfPkg/SecurityPkg: Add build option
 for coexistance of vTPM and RTMR.
To: Qinkun Bao <qinkun@google.com>
Cc: devel@edk2.groups.io, jiewen.yao@intel.com, 
	Dionna Amalie Glaze <dionnaglaze@google.com>, Mikko Ylinen <mikko.ylinen@linux.intel.com>, 
	Gerd Hoffmann <kraxel@redhat.com>, James Bottomley <jejb@linux.ibm.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Michael Roth <michael.roth@amd.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "Aktas, Erdem" <erdemaktas@google.com>, 
	Peter Gonda <pgonda@google.com>, "Johnson, Simon P" <simon.p.johnson@intel.com>, 
	"Xiang, Qinglan" <qinglan.xiang@intel.com>, Cfir Cohen <cfir@google.com>, 
	"Madhanagopal, Ranga" <ranga.madhanagopal@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 13 Apr 2024 at 11:37, Qinkun Bao <qinkun@google.com> wrote:
>
...
> >
> > I think it is a bad idea to go and apply changes all across the boot
> > software ecosystem to measure the same assets into different
> > measurement protocols. I'mm afraid it creates technical debt that will
> > come and bite us in the future.
>
> Could you shed some lights on why it creates technical debts?
>

If it is so vitally important that measurements are taken into both
the TPM PCRs and the RTMRs if both are available, can we really trust
all those boot components to do the right thing? And do we really want
to have to reason about that?

Given that the guest system firmware exposes both protocols anyway,
wouldn't it make more sense to make it the guest firmware's job to
duplicate measurements into the RTMRs and only expose the TCG protocol
to the guest OS stack?

The hybrid model of trusting the host (and using a vTPM) and not
trusting the host (and therefore relying on TDX/RTMRs) at the same
time seems a bit odd to me in any case: under which circumstances
would a guest distrust the host but still rely on the vTPM?


> >
> > Given that RTMR is a proper subset of vTPM (modulo the PCR/RTMR index
> > conversion), I feel that it should be the CoCo firmware's
> > responsibility to either:
> > - expose RTMR and not vTPM
> > - expose vTPM, and duplicate each measurement into RTMR as they are taken
> >
> > However, I understand that this is only viable for execution under the
> > UEFI boot services, and after that, the vTPM and RTMR are exposed in
> > different ways to the OS.
>
> Yes, they are exposed in different ways. In Linux, the TPM driver uses
> the mmio interface rather than the EFI service. Even if
> EFI_TCG2_PROTOCOL is not installed, the TPM as a device is still
> visible to the guest. The RTMR values are included in the TD report
> and could be extended through a TDCALL. The security concern caused by
> not measuring into every device that is available is a concern.

That does not imply that each and every component should be
responsible for taking both measurements.

> Please
> see CVE-2021-42299.
>
> >
> > Could someone explain how that piece of the puzzle is supposed to
> > work? Do we measure into RTMR after ExitBootServices()?
>
> Yes, we still measure into RTMR after ExitBootServices() [1]. One
> example is measuring container images into RTMR2 during the loading
> [2].
>

Fair enough. So keeping RTMRs and PCRs in sync after EBS() is going to
be problematic :-(
