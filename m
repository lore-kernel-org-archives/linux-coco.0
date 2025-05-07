Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672F972626
	for <linux-coco@lists.linux.dev>; Wed,  7 May 2025 23:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746659567; cv=none; b=TRHfm53uH/MKsGly4E53+MtMGDtm8L1KxHqqhmkWc7q5lB6tQpHrdc+S0SH49UlntJAeTJ1GVV6AqnKtLaJhucOzdV/NnUwks/giHU/TQbY0pARY5nHkzQrugcRh6FDjFxyC77obL0N2X8nmyFvb/QMnvNGgKpxde1KUBxQjS4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746659567; c=relaxed/simple;
	bh=ym1jjdlFd7AoqQGMDLN7xfCR2I0v44R3q5xiiGIbW3o=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=dLn0aATxepdwAiKI9mpXO+Rza+cgKpRMwELSCvtfqB7zHMhra13kqV77dDow1CCjq8mvI1lvvkEDwzUKTgQ7Z7io/1XIi/pQ16fYL90eWec4Y99AWLqFNkNaC+1SPpNtjaZXWIJNgXrTb8bGgAaISdab8jAt/HQs8+YEFoqtFdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pZ+8JmwC; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pZ+8JmwC"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-52446b21cfdso130308e0c.1
        for <linux-coco@lists.linux.dev>; Wed, 07 May 2025 16:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746659562; x=1747264362; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ym1jjdlFd7AoqQGMDLN7xfCR2I0v44R3q5xiiGIbW3o=;
        b=pZ+8JmwC9ajQUU/1D2aIAHTOZRq51tnSFxXPi674UAU5NUjC0QA7Ny5n0dnIFoJa1C
         xatvZBkI7lQkg1jSuyhmdwlozg3qyJzSfNoI6KXQOOq6yC0zwaN+nnftMKHmArQYPQjY
         qh9jtP7/7AWxVARgx/HV2DqII1Vmo4OK8mO4Mhx6PWvn0+NsfyMPEDF0BZHeS0Gz1oso
         jY7UVZWUA8GO93W3q6J6wz5ejKeBEgm9r43DzmZIzGqE9lCQ/LO2leVFFQbVvTuimxqo
         pyGcTvPd7piM0Sbz9qBPZAQQYncDoQ8uE1rpl0upuWvLi5Kzbr9mtcSZTJMg90UZVwdx
         js9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746659562; x=1747264362;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ym1jjdlFd7AoqQGMDLN7xfCR2I0v44R3q5xiiGIbW3o=;
        b=aje+1qg35gmgYyYnCv0joC1FGwliQ7pQbc/T7tZpA75lvizHnbgNHzuhv8VFmUogT2
         mnvc5rTW9FNU/2kgsK5Atmv0+LEk8/6lr4vNBo55p6LBw4pFUn4zX1S6+sgrwmUwspdy
         i22xEd1vETVF2FxxNKSInBG9iDixD01GvofHncDtXwSbp+14W1kdk8D5+IV6BMzItvvw
         2+Mei6UocukK8eCzCeQf7m8ovDVoW5Bz/P60Dzd7tN+GA02f72jmNjmKJ8j3c2Sm4+rL
         B9jHhzL5Apz7MVRDz+9QcBKOG7f9Yw/rz2ooalOA1koJa151Tfh4pU4nkmgp6f9AWBpD
         ebuw==
X-Gm-Message-State: AOJu0YzHjiOQeyO9noQGtvjhNmUE0UL7NYgjEF2ZxQtTdaRACJOO/5Zc
	p1Ln1RX0K9S36ETXGYslV89ZMit9an1yiNkZw7WtLXr0Vsk80NZmwXR9HJJ3mVM+8FywTLoSRFR
	3h8OrwX9dUkKdR81cLtUvsRCnnqNmc/alg8npWt3evt2hlwMOtNi7e18=
X-Gm-Gg: ASbGncv450CKmwA9YHjsZSXvfeU0PNqFNhxfPnaEkiLFVvmAvVAJHzlER78LhHECVSU
	lGvu6oWLx5kBExRza9q1frZK34kwweND2WBAt+5liL0WMJdhlrPP7q4FWm553Kp1qIGu+f92nFL
	fh2qSY/V0Tk10GenQcMed5xoxIOWxNsV30ZFpJ7PpbW7LDf/RZEb8n
X-Google-Smtp-Source: AGHT+IF1bELGibhYHv1oVo8WLcPDb86o96AVMRVz79iFBnwFiIocXQjSAah3h+pI/907s1r0lYvd48V1NtbQlIZV044=
X-Received: by 2002:a05:6102:5247:b0:4c3:6568:3e18 with SMTP id
 ada2fe7eead31-4ddacfc3838mr1298824137.15.1746659561790; Wed, 07 May 2025
 16:12:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Steve Rutherford <srutherford@google.com>
Date: Wed, 7 May 2025 16:12:06 -0700
X-Gm-Features: ATxdqUGowJbHUJtwgBRjbtpEtgD64j0arLK4I_qM0jOvM5Ugn8HP8FnKA87QaSE
Message-ID: <CABayD+eMbcR+ouqjOt6+6zQb1J4RYjFys6gfynd7Ktfe+bdkqw@mail.gmail.com>
Subject: CCC Kernel SIG Tomorrow, May 8th - vmfwupdate
To: linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi all,

We have an instance of the CCC Kernel SIG coming up tomorrow at 9AM
PDT, Thursday, May 8th (6PM CEST).

We have two topics on the agenda already. Please feel free to respond
with any others you have, or add them directly to the linked agenda.
The linked agenda has more details.
* [Dionna Glaze] Vmfwupdate and its intersection with non-Qemu VMMs
* [Steve Rutherford] A call for steady state topics for this meeting

Agenda - https://docs.google.com/document/d/18D820gyt2xe84Jy6dGXgrNThApoozcekDzvIlK2_bd4/edit?tab=t.0
Zoom link - https://zoom-lfx.platform.linuxfoundation.org/meeting/92401169243?password=e6c02995-6cfb-4f90-82b6-747f767eb168
Calendar - https://confidentialcomputing.io/get-involved/calendar/

Thanks,
Steve
