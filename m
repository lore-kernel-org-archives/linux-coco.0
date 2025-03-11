Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DF425BAB1
	for <linux-coco@lists.linux.dev>; Tue, 11 Mar 2025 18:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741718955; cv=none; b=AV6fMZUGDP/1NPDwrNunh2Gn12xSPld+ZB1oaabzV66lfnLyIKo/EIrpctctHjRMpsmlTNBdaTW5WChaEjrZgwkAgzFNIKnXPmRtZU+eAf/P4ROxgM6DykjE0r9FMZ/SRD3hbyZ52e+xdXHKKRLVhtqpBMr849Z02GmzjOo8Nqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741718955; c=relaxed/simple;
	bh=sYA1TxEVckFMYxaiPxQTwTk51QQHZg9peFirsjU5nGc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HvSOn53aPNS0xd6+R4VbDabYIsUSjYtZmj/mjmqB37PxlBNnN/ZW9z+sZo8ehQ2NUmWF5inGC2YmldcUVAwqjvni/O7juA4liCMO2LzEPeGejMSf3Dwn7p4aq0k/cGDGI/0BMBoZ+NbVHliBhAVy2ja9arwc/7EPzz+R+lDoYsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MFWcCpxO; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MFWcCpxO"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac28e66c0e1so442728666b.0
        for <linux-coco@lists.linux.dev>; Tue, 11 Mar 2025 11:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741718952; x=1742323752; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sYA1TxEVckFMYxaiPxQTwTk51QQHZg9peFirsjU5nGc=;
        b=MFWcCpxOROp7Q9OC+8XNhR4Fmn3feTSYIcYqBSzsoq6buR4sxvK8u5Qa4ZPZPeVFXv
         xhBngaYzhNvKkELSeRzjLDEWsCUgpJTA4v+yMhggyd7kRBHsvUapnEUKkwRqq8qfok4h
         3GW5nsyeDd+wjKC/eNpnQCv9vCXVhODLNo5XoxF5mcArMbI7ry4BbUgDAiyy3m4kqHWQ
         KFKRGRb/6BXaFA0mxN0EZSibgBMMh8qpWNUr1xEtsbpoWLTZO7aIcQfZWsrhmaFR3UXv
         Tfpw0cKs1U3C/4Sy/pl6mIcVuV4vrMNXV8rDavNBXDxUnEWgEFaP5/mlyTfhCRBzo58J
         vAQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741718952; x=1742323752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sYA1TxEVckFMYxaiPxQTwTk51QQHZg9peFirsjU5nGc=;
        b=lYbV2shMFZo0+hhEkDzfuVwzSXZ/KSlGrfftnc4b04f7g7ismtM01Pah/SfVj3tnak
         JjVv8vEew5h6V6EMBR2X3E7JrixECyZ4Cj32MJ9tMIvm8nl3JB266USS6fx0mSbqHKAv
         IfPkbxz/VTHCCV7613ZNIROxFZBckzRjTWjCDMPJmb9uGIo0s4WJUJP+4pRX5PF0LlDi
         1tuUp3fmn8vJVg1ewNqHQ0SNXUi9EII8/+8KhmFByK5uEBCgqtNHcCZV+N2I5ADsP2xE
         dJ+6VRYw+8GsFzpSL8CHZFzCujNr36BqLgXbcgs32NYgZDmT+tKQr43ph5PvFeDx7DqJ
         iodQ==
X-Gm-Message-State: AOJu0YzDlnBeRVIaS75LsJ3PN47vPYxDK/KDINmtrMbbECgFK1/807er
	Y2QN9yfWuU1FFNnkRbyYpqKkn7M5LxvojkM8kdbVOS6IULvQFhbG4ZowGrsBDAKeqVyVLDriZWT
	m+ImBc9Y47QWpojnwRTOFDiGH2OtoRC7Up2QxSoHMN9lmk7AqRlku
X-Gm-Gg: ASbGncvc490qNFouwfhpuuswzt4IPK1GkJoh1TPd6VD7EXb336+sG6cFIMvWKRUSBZy
	n13WVOI6rV9QCVCC+l98Ej+ZA2iqVIWAqTyjsspqql8njOmC5OQ7uksAATUIl1r6frvvfAFI9Fk
	/y2HzIWHhUtD0kHUf2LcX8aExX
X-Google-Smtp-Source: AGHT+IHmRnU2uKgHpiKAfsKDFgbgseDYwKOj2QbYqq2TZv0gI8xklxtSmDqf2guePf4k19GvVAwzAMOHYxELB6UeaJ4=
X-Received: by 2002:a17:907:9487:b0:ac2:cfb0:9c10 with SMTP id
 a640c23a62f3a-ac2cfb09ddamr256610566b.32.1741718951886; Tue, 11 Mar 2025
 11:49:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABayD+dsAeqQnX7izBA-RkyM5W6p7zg+hgvVEo8B2i6L-WrHVw@mail.gmail.com>
In-Reply-To: <CABayD+dsAeqQnX7izBA-RkyM5W6p7zg+hgvVEo8B2i6L-WrHVw@mail.gmail.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Tue, 11 Mar 2025 11:49:00 -0700
X-Gm-Features: AQ5f1Jqu1Mu6BL8q-A6h2KaAiC49rLdW7_iQkpzT7kChS5smNsF6kN-L8YogyLA
Message-ID: <CAAH4kHaOO-61nFtqgSHkA0Qhk5tAD8NZ-hbSFVR1oG629OD=Yw@mail.gmail.com>
Subject: Re: Kernel SIG meeting 3/13 - Continuing discussions on SVSM
To: Steve Rutherford <srutherford@google.com>
Cc: linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 10, 2025 at 3:27=E2=80=AFPM Steve Rutherford <srutherford@googl=
e.com> wrote:
>
> Hi all,
>
> We have another instance of the Kernel SIG coming up, at 9AM PDT on
> Thursday, March 10th.
March 13th, yes?

>
> **Be aware of the DST skewing that happens this time of year!** The USA
> jumped forward an hour, and, for example, Europe won't do so for
> another ~3 weeks. The meeting will be an hour for much of the world
> (e.g. 4PM in the UK, 5PM in Germany).
>
> Zoom link - https://zoom-lfx.platform.linuxfoundation.org/meeting/9240116=
9243?password=3De6c02995-6cfb-4f90-82b6-747f767eb168
> Agenda - https://docs.google.com/document/d/18D820gyt2xe84Jy6dGXgrNThApoo=
zcekDzvIlK2_bd4/edit?tab=3Dt.0
> Calendar - https://confidentialcomputing.io/get-involved/calendar/
>
> We should continue discussions of OS <-> SVSM communication. If you
> have concrete questions/topics, please add them to the agenda. Any
> topic, not just the SVSM, is welcome.
>
> Thanks,
> Steve
>


--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
