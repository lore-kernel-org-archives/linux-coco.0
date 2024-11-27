Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC3E208A5
	for <linux-coco@lists.linux.dev>; Wed, 27 Nov 2024 08:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732695482; cv=none; b=sEjYa5RNy9Y4TQ02tpKaPbqlbHqAAQUDaAQiwn/3N8pZzcQziZ18JqZzPyNQQq+hZL0oGxXqy1jf/JKl7bPaL98CA3cUdQTOOeqgrLnzsKbSb+YHO7wFljijRVVdKOEmgFIO9DTjlf2N/ZqijOm1Ghb7NlqcsuKNK7B7Vh4VhW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732695482; c=relaxed/simple;
	bh=TISk21BXC3jEnQwpJpuyTVimjYbFHgTz6GvxAf74s/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gNivhuDalWUoy+LZh7Ye8XAIEc4n+vhetCo0ggA/Tb5jv4g1qFptW46HEAVEYAaY9MHRKimj8/PkpNI59KoGEA3N8c0mcEUB/XkcVlrEDZzpUiID2WFRS5aZEsAxNq+lddH1csjkbglMqJF+PygAv1jY41EMSOva7Uw4WcK40no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UjNgPBM/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UjNgPBM/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732695479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e8CouElbYsuFBkhUzHzZg7YHq5IHGPA3eYM6awm1J9k=;
	b=UjNgPBM/w486X8FWhrmVtnviroHKpE9ykV+ZBeSkPFYf+wGGOgayvEeaEf2lrhWcv+JYlD
	Wx9q9bR2YxmBqZncP52Kw2990m9Xyz3ZLkOWKl2ejUxOF9/8q1TTnxsFqrFBu51EUCk44Z
	saH/CtZCToXNn7inDWFVOuZXTCl9TMo=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-304-q09UnrvYO0G91r7WAa7Bdg-1; Wed, 27 Nov 2024 03:17:58 -0500
X-MC-Unique: q09UnrvYO0G91r7WAa7Bdg-1
X-Mimecast-MFC-AGG-ID: q09UnrvYO0G91r7WAa7Bdg
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-6eea70c89cbso7235437b3.1
        for <linux-coco@lists.linux.dev>; Wed, 27 Nov 2024 00:17:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732695477; x=1733300277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e8CouElbYsuFBkhUzHzZg7YHq5IHGPA3eYM6awm1J9k=;
        b=vSQSQ1Gh6z6KDH2Y1fFK7ydOEI8jTL0cgjb9lK2I7P3lmymLPAzRGRg39D/VYieqOM
         f/D5X4Mid6H7A4JZZmLNLtZsH6QQuJkksLv3ThyxqqxzaiB2rrbpS61IdSGPpwK5JSVg
         XXFyhCvrJG/v18prnXytBjA42RyV9X4u26kUi0olR/5wwQy3InhiLQEPzCqKFm1aZ68e
         GTNqRFFwN87/TFZLaTWdUZ5pIo8MCGuuZ5LjC3VvBqUpFff/NDRRjZuO/6rw0hmdgEc/
         d1ipDK06rUeOvJjSjttArvPVr1cNObX9V2uBBirSX/YNF/D/W0PlGUivgOIbvZ7TsUG+
         g1Ow==
X-Forwarded-Encrypted: i=1; AJvYcCV4EQTNWpxGtOFrSGinzoS0rYUmlGlJxEdI58QJkod6VN2hidYcratAMuLnI34vpeg8+lGFvVd2Csvd@lists.linux.dev
X-Gm-Message-State: AOJu0YzeCol7Fp2ZL1/P6qripdeYudN+T3vZVlfMrukf66nPWXOumU3C
	f73NOkRmJF8w4GVWLjMUYNPbMRWbd2m+O1SB5NGWG5wimGXAl4Zwc74772vlkYC0XMdTaWf+jd3
	GT+bCAwVNPZzNEIyWulL/2SrM8LqMTW95mVkiSYnwoKSY1j5I/LSx11DOo08hzYfsmAfbJO8nlm
	KoVM0QGSazsk6JtbQbXxl81FYfDanbDEVHjk1Zds/GNPp5
X-Gm-Gg: ASbGnctY3h1sYKLAvoriZU3I6BeFdABlkCM704sX46UnQLiMyfaOkaYDKlMk36PByjH
	lWfMKkGoPLK4TnUmrPMc/7uOqXH4ZOq4=
X-Received: by 2002:a05:690c:670a:b0:6ee:8088:831d with SMTP id 00721157ae682-6ef23d80cf8mr58666917b3.3.1732695477340;
        Wed, 27 Nov 2024 00:17:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWe3CILeBCYPQLrSv6lXb5KZnkgktwoubYcczrGylYRDRJyu1O7yCwB2XX4i8bmgxQhgCfjBFbgtACrYkIOSY=
X-Received: by 2002:a05:690c:670a:b0:6ee:8088:831d with SMTP id
 00721157ae682-6ef23d80cf8mr58666847b3.3.1732695477032; Wed, 27 Nov 2024
 00:17:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z0X5ebN6KE05gOR9@8bytes.org>
In-Reply-To: <Z0X5ebN6KE05gOR9@8bytes.org>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Wed, 27 Nov 2024 09:17:45 +0100
Message-ID: <CAGxU2F7Kp64HNq2ZEne=RJfqkBmvuCKNyp31JfiO2TJX5tomwA@mail.gmail.com>
Subject: Re: [svsm-devel] SVSM Development Call November 27th, 2024
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
Cc: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qERulp0ARmwgCrEF7S8klrGo7sj86TFADDxhBemdDL0_1732695477
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi J=C3=B6rg,

On Tue, Nov 26, 2024 at 5:38=E2=80=AFPM J=C3=B6rg R=C3=B6del <joro@8bytes.o=
rg> wrote:
>
> Hi,
>
> Here is the usual call for agenda items for this weeks SVSM development
> call.  Please send me any agenda items you have in mind or raise them in
> the meeting.

If we have time, I'd like to talk a bit about 2 topics:

- status of QEMU & Linux patches
- unsafe block documentation

Thanks,
Stefano

