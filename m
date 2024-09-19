Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DCE19E7F7
	for <linux-coco@lists.linux.dev>; Thu, 19 Sep 2024 15:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726758464; cv=none; b=RbWNvrViJc4tAgzbaiAkkyMuqB0JQtXKP7wVs9Vx9dlUfPNlawJCrDlNPQgGX2Y/PgMDzYjg7DGmJ3Z7HU3+3PFP4gj584GdmGNAY33ddf0AJpByqZ5KVyaBh0ONXtwkliMWqTr8BiPG1YZaE0W5pdunoo/j6dREJHteXPWmHRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726758464; c=relaxed/simple;
	bh=zTX2cg50iHlLd3llr0TXiQMRYPkIqgvqhdCjB4ltTqA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rAQ0/PeuAOzNTaNtONtcY9knWtWFTkfONXF7MCNi2hSUTeqPv20AxSXZC4WOQFNznM42e9IBJnKuKW43sfUMa7U0/iUqhAC6lQ3DuBzOv4F+XrsZxqne6HbyQPqY+/3SyLVCGzUQvvkchzUcYjaxMbZ2vXMGRn2zRYGnSJsxQ0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y1v4uTFv; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y1v4uTFv"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7b0c9bbddb4so649995a12.3
        for <linux-coco@lists.linux.dev>; Thu, 19 Sep 2024 08:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726758433; x=1727363233; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zTX2cg50iHlLd3llr0TXiQMRYPkIqgvqhdCjB4ltTqA=;
        b=Y1v4uTFvFlC6btjxR6+a2rDeY9PwvLfLJ5mZBNr5h1oE7MBiXDbFU+0CD32U9TrbLO
         CkezU9ydZe4GUGQJTE33CZzWdmeAA7mUuSl/1SAJX9nsvwRHBlZpBd7aPmqlgVic4Zqv
         uq+PCT7hOUb0aFcqhoVjtaq/atNS4ORcDvmHrMNeRp/TS8vToGLyCGGXFTu+BLgt0BkY
         8awEqrgqSdoXozLLX7m27sACyts9nkLo7KviTtexp86zF+WpK6NoGxcVJ1C/4lfiSu60
         Ckr/7Gx1eUK01PKmD0BnkenNYomOsAfAmCt+LTBi4EFQtbXqUUEnlWt7UrW05wLJlMGs
         v7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726758433; x=1727363233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zTX2cg50iHlLd3llr0TXiQMRYPkIqgvqhdCjB4ltTqA=;
        b=Mz71dxd7+QPJW7N8ZOUwjiDPt4nSAbVVbanJwTonyIjlXrlWifpVbE+VE8rnqKwif5
         GQLmR15/cPwxVpq2HeBGZMc65WBa67Io2N07zw8oM1HL8KV0tr17ZJ5qKvYJpNVEdUFI
         0mobb4dGuX1qVgsHAMTeorwYIAoa8l910v0PezgVoHm8sf5G02XZw6uUoU+HjEF8qyMj
         s9RgkynXO4Tc64Z1XEjk1XEjwR4Ip5ewYdWVPV4JPyLjT9+vjYLNP/B2R2GWE0yCddcC
         di1CLKYRufXznivAf4YNIKDhusH9wXUSC0k57Gx+p5BWh/wJWzTor1PTiFNS5A4zZbQc
         OFwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOoq9bwKeujjmc3jAPQzSikHLicgXtrilr1ynQLxddpt1zagpcDm413EUImeI5ID1kPK1tetLDGpE5@lists.linux.dev
X-Gm-Message-State: AOJu0YwaW73zauld7ki5K6zRJ+ZC8tET6s32mGEcSSu6GsR1dWuI45dy
	67QnFLBbuwCtVrtStUOwmMY73b/lfF48HG6cKh7RqLuglfj8OiQPUub0cdRgy5qDTGBAo+UoztM
	tT2HZ2SdIqntxsAP48POPiCwIpo/hSKQ24ta2
X-Google-Smtp-Source: AGHT+IH5KdWmVYdVGhH1YJwTT9BeiFn9LnB6HS47xkZ4yRuON9VoQ2KHUIf+6fZMyNC/5O3cZX2xrGxHoy1y3uidUWk=
X-Received: by 2002:a05:6a20:ac43:b0:1cf:476f:2cef with SMTP id
 adf61e73a8af0-1cf7624b4bamr32388167637.49.1726758433158; Thu, 19 Sep 2024
 08:07:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZuK30-Ug790Vbhck@8bytes.org> <FD656EE6-DC11-46E5-B9BE-7A7647316581@8bytes.org>
In-Reply-To: <FD656EE6-DC11-46E5-B9BE-7A7647316581@8bytes.org>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Thu, 19 Sep 2024 08:06:57 -0700
Message-ID: <CAAH4kHZoLEjhHv8wD_Oj3qjQs89dB2Q17O5T3sLnAa6gFia4AQ@mail.gmail.com>
Subject: Re: [svsm-devel] Invitation to COCONUT-SVSM BoF at Linux Plumbers Conference
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
Cc: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The livestreams don't appear to be named with "hackroom". Do you know
which to watch from this page?
https://www.youtube.com/@LinuxPlumbersConference/streams?app=3Ddesktop

On Thu, Sep 19, 2024 at 7:57=E2=80=AFAM J=C3=B6rg R=C3=B6del <joro@8bytes.o=
rg> wrote:
>
> The session is broadcasted via LPC Hackroom #1.
>
> > Am 12.09.2024 um 11:43 schrieb J=C3=B6rg R=C3=B6del <joro@8bytes.org>:
> >
> > Hi,
> >
> > The COCONUT-SVSM community wants to invite the Linux, virtualisation, a=
nd
> > confidential computing communities to our BoF at the Linux Plumbers
> > Conference next week in Vienna.
> >
> > We hope to gather ideas, discuss problems and get input for the next
> > year of development. It is scheduled for Thursday, September 19th at 5p=
m
> > in Room 1.14. Details are at this link:
> >
> > https://lpc.events/event/18/contributions/1980/
> >
> > Hope to see you all there!
> >
> > Regards,
> >
> > J=C3=B6rg
> >
>
> --
> Svsm-devel mailing list
> Svsm-devel@coconut-svsm.dev
> https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel



--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
