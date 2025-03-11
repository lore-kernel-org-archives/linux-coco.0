Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F91267AEE
	for <linux-coco@lists.linux.dev>; Tue, 11 Mar 2025 19:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741719789; cv=none; b=KFReJJ/yj9qPjhOjR/Ke9rHiA8g0RFmJIgSnesoS6FQ7x9cahXRY+PNolHW0bg4b+Zvxbl6fC0l9dKhvrrIrdbaptVvp3qtFhYTvbu11+3Sg5hODxTk99irXgzHLXIklCY+xnK44Cs20aALRXqwa1YrI3QK71CS34MDAVRwX8T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741719789; c=relaxed/simple;
	bh=a+G3ktv7XSYAXeW3+zo8X/exI06nPQhUgW2tLJ59+eM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rEtHpO8Z3tl73fQF/zXJH3AsuQKtZp8+kF57USGNJe5eWLow00I2gpyNQ+i+Xb8iANNEt/SXhvJ0TILmBiddgf+fTuUM+zDnkb3yeTbvVHt8XcYh0/vpiOahGfAVcgdLsgdxYDpWgoFUh3R/MufFlfZGrnnHkQmpg/KaiV+T2cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S6UGxtOd; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S6UGxtOd"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4767e969b94so45215001cf.2
        for <linux-coco@lists.linux.dev>; Tue, 11 Mar 2025 12:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741719787; x=1742324587; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a+G3ktv7XSYAXeW3+zo8X/exI06nPQhUgW2tLJ59+eM=;
        b=S6UGxtOdXnto9WQoO4S4O4+4YT6+1D5JnbX10lgHEZ+13+gGkye76ZiV3RKG/1lhME
         ofFYU6LxISwAZ80KD78cWNJPDfiLxDIrQRKHirqMfhn+xa4u8obGNCnB5kWEEbiu9uN4
         YxiP3tbMdlvC/ZT0qr4QaQ2emAnfo6xXUmJFthSBFqxcB7uFfvDytUE2cP8WIlF99SHd
         el2HeLz8+iotkZvYu7GNbxz/1llfHARoyuFP7MvUy5dcaZE+xs3jILBr7+CGyz4xYWMe
         Gueyw+eqfvBxJptpobJPHnX08xIeQ2610IBLlk+QRUxqVmYhThLNqv37JLhOoCireTzC
         DIzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741719787; x=1742324587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a+G3ktv7XSYAXeW3+zo8X/exI06nPQhUgW2tLJ59+eM=;
        b=gatANhoEAFXoKDuRyZ+uRFI/lTXzndJtWDnoCH0GjjM6ENz9uFjTo/XaROnJcVupeU
         AS7etFw6cjBCwOrMYulHa0zgwW0OktC9DBFvvgH1whwlz5I08BMJZsxZsyze9IE87mzo
         D+n62LGvPUKV4D7XIJrl3lPHvq1hGRIAg+JLZCdQUH01r3i5Ke8RkZBITvOIag2ELFJb
         Br2AF9FMZu22BQKTthhoSe0JQbsOzagYBHa0LLzI4OJw6vaMrRzNDQmXelQlGEB4+zbA
         Oc/fv/hcUoQxA9xbP0ddNdIwQhNw6QghhtD2iXRfxHUGTTTXthZcRQ7XeCfaHESrlf+E
         uJ/Q==
X-Gm-Message-State: AOJu0YwXHLtWZUn2QPUFqcX1kkdXtHyKq2GIfXB509MrrLjqfIf7RNG5
	twY+m7zFK3vF4KYrZwtw5mR80HxD1CKLPWCyhl/Hpu/QvLpjFZGJs1ppBxmbnX3540JAvtPuv9j
	dMhzMZWoZH/gNkj9DsbJC7knTNf/fkD4oRSOJ
X-Gm-Gg: ASbGncv3bSHXD7niEg235j+QQbRVptKoyh6xe26WbukMrdOyOV8Q0NizYY2CYzxeKKK
	q4wNwYK7pd4Rd5p+0xtCJHsAI5usRwjRZz8qtdlmEpJlGqnQpNvTGJ+LOpqt/FcQKerRyNDy2dl
	Rqj+mlJb9FIntLuLCyjrMmhiFX8AfT0waCvwCE4xvM0AEmP6PlG+yJ/MG5
X-Google-Smtp-Source: AGHT+IFIKCBXWud3BGbPdZIMtpxHPM2FWYepT0hlh0UQPKNMf8jje7xNmv5nY9V+hyZeEbwhxmhch9CLoRxE/pvianA=
X-Received: by 2002:ad4:5c6c:0:b0:6e6:656f:3c34 with SMTP id
 6a1803df08f44-6e90061fd83mr187171486d6.12.1741719786518; Tue, 11 Mar 2025
 12:03:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABayD+dsAeqQnX7izBA-RkyM5W6p7zg+hgvVEo8B2i6L-WrHVw@mail.gmail.com>
 <CAAH4kHaOO-61nFtqgSHkA0Qhk5tAD8NZ-hbSFVR1oG629OD=Yw@mail.gmail.com>
In-Reply-To: <CAAH4kHaOO-61nFtqgSHkA0Qhk5tAD8NZ-hbSFVR1oG629OD=Yw@mail.gmail.com>
From: Steve Rutherford <srutherford@google.com>
Date: Tue, 11 Mar 2025 12:02:30 -0700
X-Gm-Features: AQ5f1Jr0KaIi56718beb5yiIxFIJJNB2TMu8RA62iX4XmUPNPJHOjw_SyTkbdY8
Message-ID: <CABayD+dSjFc5ET3_qigp9Xz-7R328DcPhpkja4ahpqDTOLmAhQ@mail.gmail.com>
Subject: Re: Kernel SIG meeting 3/13 - Continuing discussions on SVSM
To: Dionna Amalie Glaze <dionnaglaze@google.com>
Cc: linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, D:

Thursday, March 13th.

On Tue, Mar 11, 2025 at 11:49=E2=80=AFAM Dionna Amalie Glaze
<dionnaglaze@google.com> wrote:
>
> On Mon, Mar 10, 2025 at 3:27=E2=80=AFPM Steve Rutherford <srutherford@goo=
gle.com> wrote:
> >
> > Hi all,
> >
> > We have another instance of the Kernel SIG coming up, at 9AM PDT on
> > Thursday, March 10th.
> March 13th, yes?
>
> >
> > **Be aware of the DST skewing that happens this time of year!** The USA
> > jumped forward an hour, and, for example, Europe won't do so for
> > another ~3 weeks. The meeting will be an hour for much of the world
> > (e.g. 4PM in the UK, 5PM in Germany).
> >
> > Zoom link - https://zoom-lfx.platform.linuxfoundation.org/meeting/92401=
169243?password=3De6c02995-6cfb-4f90-82b6-747f767eb168
> > Agenda - https://docs.google.com/document/d/18D820gyt2xe84Jy6dGXgrNThAp=
oozcekDzvIlK2_bd4/edit?tab=3Dt.0
> > Calendar - https://confidentialcomputing.io/get-involved/calendar/
> >
> > We should continue discussions of OS <-> SVSM communication. If you
> > have concrete questions/topics, please add them to the agenda. Any
> > topic, not just the SVSM, is welcome.
> >
> > Thanks,
> > Steve
> >
>
>
> --
> -Dionna Glaze, PhD, CISSP, CCSP (she/her)
