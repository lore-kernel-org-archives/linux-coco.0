Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5579C3BBC9
	for <linux-coco@lists.linux.dev>; Tue, 10 Jun 2025 00:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749516193; cv=none; b=slEStMQGk20TD+MA7zPHESLBCoQQ6nk3fILN3CcYK31FX8V33gdg3lfv10s+3rVNbnvWHux8byuu4mBp3Q5bau4pEFeZ1DU3aQqiErWTF2uJfmm7FboWyqN/QyA0Pd4jYEx6sTNvSAWRa5uou7LeWe291423n1FIjO54lIh2fHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749516193; c=relaxed/simple;
	bh=DrsvzlG7HIaUeByDAoIeUu6XGjQtzIjZZ/7diqa9y7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W4Vmud0FoK4LrUNrohdj+V6fAUihUJnuGSLKfSswSsgHbHpYtLk2Q+ZCpYHbNTGZ2L1hrwnHjXziIsw9ivYaDmbAOYGi7zf+ZwWsy7Aw+JnX5L0q+m3O2Ej9A7uAuH/0mqBvVJALxTodJJhym+hmmAxq9tp2tXiwHMq8/gRXoWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VQHsxQ1r; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VQHsxQ1r"
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-87ecba78750so682225241.1
        for <linux-coco@lists.linux.dev>; Mon, 09 Jun 2025 17:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749516191; x=1750120991; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DrsvzlG7HIaUeByDAoIeUu6XGjQtzIjZZ/7diqa9y7k=;
        b=VQHsxQ1rxHbqm9MnEXeYu9ozlM/cGHolZLy2dGOvyviHztty2isnYQSwLm0CRMTx+e
         30SgUZ3Mc/yRfv7m+sS3O2+oK4PXKDyywWfqI4W9SRONNX3/UgY9rDDlYHQeqpjtRcDB
         ULFcYbYLg5FbVtGYenzM348qur/+pHlEUJ94Pc0EPqwVwLAxrHpo7UF8tW/5cs+sxiwo
         cIiS8OL0BtVa8TTRsUx6FCLtJjsyimCVz21mklEQ1cTNy8+7K/asI8xwHKELbMupJYwu
         +GZVrpSpA9dlJAKgImGyrZA8YeThhoR4NroaY5jbW3opWga/WW13ERuYYucOwkqj6uvH
         hHRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749516191; x=1750120991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DrsvzlG7HIaUeByDAoIeUu6XGjQtzIjZZ/7diqa9y7k=;
        b=oxual6JlhgYx/HaibW4GVZCftboXjiTaQfKS7tEC/6m9yv6F0nlVuqwDRyggOmoYB8
         Aruk/Ae9Bu8c84jAXN7IYKSsciMpwnpKM+zvOEO70cqFEMYy/1jqAJb0nBUDwF9xgI0Q
         ike6BvmfZVvkuBDTkRR0S3HfE529Zs/Q00Bu5tHiV4F6bPPm2uQQTD7Fafd0cAWBDl/y
         RTujZSt9wheSCQG19TeNXE+bki5iW80WWTcJ1guUtHycM4A4dLeRxOuRwmBD/hSnVblG
         Us8jT27N2XXs1BLc+6Lu7JHDZUl1rYzQc+9kRyer2jGOrmlD4jABqmX3NmszWs0OmszH
         bMiA==
X-Forwarded-Encrypted: i=1; AJvYcCUxYAMSmB6XKEWiUZX1kOJ7mErlA55hYlB/v1Oe1msFfYjng+LLWrciaiWH4xl0XxjcS41TOLWjN1zC@lists.linux.dev
X-Gm-Message-State: AOJu0YzzbofGcja5ZYxElcIM1KREJKClg0BE7GumzKywzCsrfV76fQZH
	34yhdJpjGEDcFbFeD5A1T1r0Bx8MYfEBxAOIZ/RBElWlRlbg5agUKPEjUGR2qGX/McvQ47TECiM
	gOy+dsQwKZi0sdZEYjLhRxO0qHWBgIr9ZhkrxfDM6
X-Gm-Gg: ASbGncsgFeandAyfllSpfVArtHLWL6DvRP1qyIDe89YwYDB++aoeZcjxR7BezRgu8Ym
	nw1OBTRYrVGSk+ARM+642Asf3pXE2T1Vt6vyMEJQoa6sCpPpXwWLkLholXrY44p2tj7mMqoULGO
	QZIH9FqWkJjOz/JMMRZmaixnDDmkZ4evaJyADERt3BJajvUn47/LtKULdEspPdw6pmOEmS6df6H
	Q==
X-Google-Smtp-Source: AGHT+IEFx5LVYp9+A2yGXma2DQNV5spZGGlnCu36kKRGZoEbaYWzORO11OK8dsJ2QQ7t+eAWLe1Db6zpvQuCxrFVWYk=
X-Received: by 2002:a05:6102:809e:b0:4e7:3d55:5212 with SMTP id
 ada2fe7eead31-4e7729f4214mr14260457137.11.1749516191033; Mon, 09 Jun 2025
 17:43:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <LV2PR21MB31800E697258585BD0DB7816A56BA@LV2PR21MB3180.namprd21.prod.outlook.com>
 <CAAH4kHZDnfe3L3rJ2htEzT8FCbpVjTmU+u2M94mHbxYHw07WFQ@mail.gmail.com>
In-Reply-To: <CAAH4kHZDnfe3L3rJ2htEzT8FCbpVjTmU+u2M94mHbxYHw07WFQ@mail.gmail.com>
From: Steve Rutherford <srutherford@google.com>
Date: Mon, 9 Jun 2025 17:42:34 -0700
X-Gm-Features: AX0GCFvpONO1VK4TxPpcl9Z3RTO63R05hq6z89x8YepjEcL6XI1vO3z_0S078Ck
Message-ID: <CABayD+dRib6_hhGv87WbomeFaFR+edvKnm5pAWWxPMUoCKE1yQ@mail.gmail.com>
Subject: Re: Confidential computing Linux kernel SIG meeting Thursday agenda
To: Dionna Amalie Glaze <dionnaglaze@google.com>
Cc: Chris Oo <cho@microsoft.com>, linux-coco@lists.linux.dev, 
	Alexander Graf <graf@amazon.com>, Jon Lange <jlange@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Agenda should be in the link pile at the bottom of the email:
https://docs.google.com/document/d/18D820gyt2xe84Jy6dGXgrNThApoozcekDzvIlK2=
_bd4/edit?tab=3Dt.0
(I'll make it a bit more obvious in future emails =E2=80=93 This isn't the
first time someone has asked. The linux-coco requirement that the
email is plaintext makes links a bit awkward.)

f-UKI is a reasonable topic, we'll just want to make sure the relevant
folks know to come to the meeting.

Thanks,
Steve


On Mon, Jun 9, 2025 at 2:38=E2=80=AFPM Dionna Amalie Glaze
<dionnaglaze@google.com> wrote:
>
> +Steve Rutherford +linux-coco@lists.linux.dev +Alexander Graf
> I don't have the agenda, no. Steve runs this meeting, so I'll let him
> comment. If there is nothing else planned, I would recommend the f-UKI
> topic if Alexander Graf has any further design updates about launching
> a firmware directly from a disk image.
>
> On Mon, Jun 9, 2025 at 2:18=E2=80=AFPM Chris Oo <cho@microsoft.com> wrote=
:
> >
> > Hi Dionna,
> >
> > Do you know if there was any agenda for the CC Kernel SIG meeting on Th=
ursday? I don't know where to look, so I wasn't sure if there was more foll=
ow up discussion planned about f-UKI from the previous one.
> >
> > Thanks!
> > Chris
> >
> > Sent from Outlook
>
>
>
> --
> -Dionna Glaze, PhD, CISSP, CCSP (she/her)
