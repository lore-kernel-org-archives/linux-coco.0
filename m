Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF90335966
	for <linux-coco@lists.linux.dev>; Thu,  8 May 2025 17:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746725381; cv=none; b=p6rG/gydorfToqIXkEYqKBVAd3Dq8bomRD8jAqqnyAcaM5J0z4fFJw8HVd7Yb3J52cMfJmaVSHI16RJ1DdClAlKlvdheCq2ecbWex3BtPM/rz1Ns/zGyWqr4PNfRr3QUD5aWxg1SyLrVkxPNhpA8G9EKrHI9rchHVUxl2k1wrB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746725381; c=relaxed/simple;
	bh=/WSNudjm9eqj6ZRv2TvvzlnvvW1aU5EK07HHjLcFBSo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jTW9xZKU56UxH9TU5q0i4KZMPur0xPY4ps3dZ/rHr+ntPYxubFjrgbje4IDRFm9jCI4nCMPNHVKzLvyop7dTrhA5v+/zvgtAySqcMmKr//RZqK5Biefp7MqlD79MpgBwlnY4h48C2mvfEqT33wQnhrKWbpQurzhscvn75VWzGu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v+t8xfCw; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v+t8xfCw"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-af908bb32fdso1182601a12.1
        for <linux-coco@lists.linux.dev>; Thu, 08 May 2025 10:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746725379; x=1747330179; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=39hgDkeAw52pzQSb9AKA8gUMnnBw5jVpaE/FvPHQI4g=;
        b=v+t8xfCwDh0Gg3trvFu59N/ZrGR+xPCZmrEza8wEtpdMcGkK6x2GtfQ2RmR03Q4oPE
         Xh3jB3ItMEPuRLrnvv2IjrRWfosgEgLt5qJPpiPTdHmsTAxnp/KPei8Quj7LbtjoYw8u
         xiAzyAUEp8pzlgQgr+MHjhWVPRNEnbg5OfqHswCdIxGjspX/bDo9/TQk1mQ6B2moVs23
         DP03q8esKLeVXYZvceEfUVFSsKrTOs/8yXOXSUrSI04ee3+sI/Dvs5tB/Y3t8nNi4tmI
         bIaO70426NY5IopN28JWvTQch3h/dPVPCB6seTNv72usStuPv7sSX7Ajtg8+7ubFP6sA
         2Jsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746725379; x=1747330179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=39hgDkeAw52pzQSb9AKA8gUMnnBw5jVpaE/FvPHQI4g=;
        b=KABy+SItUkpydWF71dijAiqbA33RfnlYylGVNihr+6PehXx8ZMzfEBQnizwn4RWwH+
         /s5u29YOE9sGYbqtVfLeOzcX228+dAHFf2NzKjW6r9l/RPK2Mfw2M7uVpW7i71X0vX8e
         8x5n/Iz2afiQlD37K/EPkdSkdEeSIw+jmlKtO31eaFomOwkG7a04DUZYU4K9Ta6EJBoD
         6fsdkTwXEo7OMVlf2lQnAeJCJFw8W7sM7uTBsL+s3l+BKiR41Qk+WbmMUl9+LS2ic6Cy
         gw/exIU8EAdOyTmcKibmpLkXmVm/t7eNiUlflzpJeDqEcWht73X0/KO2e0gFbzq9bIHW
         hyOA==
X-Forwarded-Encrypted: i=1; AJvYcCWGWLZHUFRAOWKNMcchP7cmp/ILNmRKgqf3c5d56o96PWlklgXuYqZk54pWne9lyttGqqDH5UiHbHWA@lists.linux.dev
X-Gm-Message-State: AOJu0YyswSQ00e8tbOlhmEdU3PiZQZwcd5zZt3NX718JIAeFZbTmB3V2
	3MIHFAu7C2H4jJAxx9WYZ+yvaOMH10LPTOG9FiJ8C/LWXY/ftcnvEuTmgPVQ0ZE0tVb3UAOKk48
	vU1AdYKwwdu9BVfI+WCNimCcWxfR1YnXLOMSE
X-Gm-Gg: ASbGncsPuHOps6XAeecc4wSrF8AY/qRf7X+yuilp5EKA1yAupc0pMpE9/DfaUIzgZgO
	C32U1Bx7EEQ1uUs98jaYVFy0yNuUH6yXuA43mpBlx9ZO11Rgewt7efI0MplFoNvtXfs/VigDwbA
	WIOcOvdiv2sOkgNf0YlpFlrvxFNH9UrVkDEMjaVmrzbY2DExhoLTr2
X-Google-Smtp-Source: AGHT+IFDIRqHiJaauAqKruNCFJSsNxC/s/cIri3USdA4spHTAJiRFWGS20x50aP3bcES/rUiqalYU3NSSymAcU+lz1E=
X-Received: by 2002:a17:902:ce86:b0:22e:5a9c:2853 with SMTP id
 d9443c01a7336-22e847358e8mr61351865ad.12.1746725378583; Thu, 08 May 2025
 10:29:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAAH4kHZ2yO3ju_iJinR9y4BDXXdWBnEP1wcv09JWMzaqp1ZP+g@mail.gmail.com>
 <CAK3XEhOs4ijnbqmv8UrNmKN4=nv6+_A7fESLibGBRR9u8rXi6w@mail.gmail.com>
 <87frifm75c.fsf@redhat.com> <CABayD+eRjjknqJNRkkh9_KraC-jZyXb1BL_D79m04po1_hR-_g@mail.gmail.com>
In-Reply-To: <CABayD+eRjjknqJNRkkh9_KraC-jZyXb1BL_D79m04po1_hR-_g@mail.gmail.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Thu, 8 May 2025 10:29:25 -0700
X-Gm-Features: ATxdqUF7-kbAs4g-Vy97uLogauf-QCpW5GNN87iiaDQ1WeeC0ZhAliv8W_v6fp4
Message-ID: <CAAH4kHbCduQr_+oj0X8QeTjgDgh6aBncPV-1+mvB_r1R3i7Lqg@mail.gmail.com>
Subject: Re: Linux kernel SIG meeting for vwfwupdate discussion
To: Steve Rutherford <srutherford@google.com>, linux-coco@lists.linux.dev
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>, Ani Sinha <anisinha@redhat.com>, 
	Joerg Roedel <jroedel@suse.de>, Gerd Hoffmann <kraxel@redhat.com>, Jon Lange <jlange@microsoft.com>, 
	"cho@microsoft.com" <cho@microsoft.com>, Alexander Graf <graf@amazon.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks everyone who could attend the CCC Linux Kernel SIG meeting
about FUKI and specifically the firmware replacement mechanism.
Please +cc any participants I missed.

Meeting minutes:
* the concept from its initial version that was Qemu-specific and used
specially-named FwCfg files to direct CVM context reconstruction with
a different ROM.
* the viewpoint of generalizing that interface to be an IGVM-based
firmware loading instruction in order to reduce the interface's
interpretation requirements to keep focused on an emerging standard.
* the usefulness of "single artifact" VM template distribution, such
that the firmware can be disk-image specific and not need extra
orchestration to lead to VM construction.
* constraints of the different VMM providers, namely
   + AWS does not have access to guest resources. A disk can only be
read by a guest VM.
   + Azure doesn't have this constraint and does not want to build a
stage 1 VM just to tear it down to boot a stage 2 VM every cold reset.
It's far more preferable for the host to have the option to determine
if an IGVM will be requested to load, in which case it should be
loaded directly without VM construction.
   + GCP emulates Qemu devices and could implement the FUKI interface,
but would prefer to use mechanisms that are standardized through
professional bodies like the UEFI forum. Faster boots without VM
reconstruction are also highly desirable.

Jon requested for Alex to give some more design consideration into a
mechanism that would satisfy both AWS and Azure's constraints.

Alex suggested the framework of a solution: mount the guest image,
search the boot partition for a specially named IGVM file, and launch
that instead of the CSP's firmware.
(Dionna notes outside of the meeting that this has the danger of being
an unsound optimization of directly loading the disk image under the
CSP firmware for FUKI application to load the IGVM due to no
requirement that the FUKI application load that specific IGVM file)

I look forward to our further discussion on how to provide a more
trustworthy Confidential Computing experience in the Cloud for our
customers :)

On Wed, May 7, 2025 at 4:04=E2=80=AFPM Steve Rutherford <srutherford@google=
.com> wrote:
>
> Heads up, this meeting is tomorrow, May 8th at 9AM PDT (6PM CEST), if
> you all are available.
>
> On Fri, Apr 11, 2025 at 1:31=E2=80=AFAM Vitaly Kuznetsov <vkuznets@redhat=
.com> wrote:
> >
> > Ani Sinha <anisinha@redhat.com> writes:
> >
> > > Adding Vitaly as well who is also involved in this project from Red H=
at.
> > >
> > > On Fri, Apr 11, 2025 at 4:46=E2=80=AFAM Dionna Amalie Glaze
> > > <dionnaglaze@google.com> wrote:
> > >>
> > >> Hi y'all, my colleague Steve Rutherford runs a monthly special
> > >> interest group meeting amongst Linux kernel developers under the
> > >> confidential computing consortium umbrella.
> > >>
> > >> The f-UKI concept presented at FOSDEM is a very interesting idea for
> > >> improving customer trust in cloud confidential VMs without the need
> > >> for complex control plane resource management for virtual firmware
> > >> EEPROM.
> > >>
> > >> Microsoft has proposed a firmware loading format called IGVM that th=
e
> > >> Coconut-SVSM project has adopted, and has support in Vanadium
> > >> (Google's KVM-based VMM), Qemu, and OpenVMM (donated to the CCC).
> > >>
> > >> I see Alexander from AWS in the Qemu threads for vmfwupdate, so now
> > >> that's at least the top 3 CSPs represented here.
> > >>
> > >> I think for everyone in the To: tag here, we all have a vested
> > >> interest in improving the CVM trust story without making the
> > >> virtualization ecosystem even more challenging to work with. I'd lik=
e
> > >> to invite you all to our next meeting
> > >>
> > >> 9am PDT May 8th: https://confidentialcomputing.io/get-involved/calen=
dar/
> > >>
> >
> > Hi Ani, Dionna, everyone,
> >
> > I'd be delighted to participate! May, 8th, however, is a public holiday
> > in some European countries including CZ where I'm based and I will be
> > traveling on that day so I may not be able to join. I'm, however, prett=
y
> > certain that Ani/Alex/Gerd can represent the idea very well)
> >
> > --
> > Vitaly
> >



--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
