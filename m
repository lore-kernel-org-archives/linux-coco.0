Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF799457
	for <linux-coco@lists.linux.dev>; Tue, 11 Apr 2023 20:01:59 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id q2so13860411pll.7
        for <linux-coco@lists.linux.dev>; Tue, 11 Apr 2023 13:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681243319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QZJZV+00U1PjCKp/KXUNYCO8B2rEbR+LZ2jAdA9mfb4=;
        b=yZ5ZU+U8vx1wvIaqCj8jLt0S3tSKHmP/ShywKOL6jLWJveEWYUCJ3tr8nD95vhYI+x
         QtgEYoA+oXsrvghkf+EJ7EM0yWZvAYtIYXFb0cuBUF5ZhPT+22PBIJTIo/8bdGXPz7TK
         Gl0/M2xMXPbDOjr0CCuQM5AzlyZv6WIxkOIkY1dZNrbQQ30XlesGsnnu9ziclW8mq8K0
         VFziObrwle8/3ZaWiaKGPnlDlFDycDVOXDVG3XLXcXrzhXlLHwVXy9rXMm394usi+vsx
         Di3yAprbFumRoUZVjfKDg0JqPe+wYyJKPrpmZKA3P0oRX70XVIC2wpgpchFldRr5dsdj
         qjFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681243319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QZJZV+00U1PjCKp/KXUNYCO8B2rEbR+LZ2jAdA9mfb4=;
        b=wob1bCoYPJuAmZH7fmSWvZpIGq0jkjGB0Q10/0ineD8kWdnu7ImcEQhx0r2bUJzXvq
         ZULS/3qxVtJPAS1XO2StRU3kwLLy2wBZpMxGa/D9YXM8YF9/xQK8/fgmp41IQ8ecQujm
         W2/OODM8Z3pRJh97sT2CzhU/PrOQwuLqJUZgAIgn8kf2pIkpcuiDYOL2oyf+8eorR3tg
         rhE/tpqsx4zH23NfPIcEhkn4dPmpuTX+OKDuJw+zYrXcUqeOJXhBMpXpaDwgmfM3SOwn
         xsotehs+i7dcwcUGwq1BOdV2lLUSOtzLCW8GHmQQjvAVNexIGzTx29+3UrK0crEelKLT
         Qngg==
X-Gm-Message-State: AAQBX9edvDWasfQj76tjoItiE9K/qFw7nWnlspif38Oo0YJAovhGhSvB
	zETF6lae212m1kVg58zIavA3rqybAxTrUKaEZDf0tQ==
X-Google-Smtp-Source: AKy350ZB8w/35+QJm1URvnj4NpxgWc5vArTpHhKIzSDpVvNrL4hP5ylw9/fOi2FaaC7LyWMpaxzjApY4fio29V5hgKc=
X-Received: by 2002:a17:902:f301:b0:1a6:6a6b:5191 with SMTP id
 c1-20020a170902f30100b001a66a6b5191mr184197ple.11.1681243318533; Tue, 11 Apr
 2023 13:01:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZBl4592947wC7WKI@suse.de> <bf7f82ab-3cd3-a5f6-74ec-270d3ca6c766@amd.com>
In-Reply-To: <bf7f82ab-3cd3-a5f6-74ec-270d3ca6c766@amd.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Tue, 11 Apr 2023 13:01:46 -0700
Message-ID: <CAAH4kHb9VPF8RvLAyrK6JHNPT4RBp12tPDUTL2v6XrfQqc61jw@mail.gmail.com>
Subject: Re: [ANNOUNCEMENT] COCONUT Secure VM Service Module for SEV-SNP
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>, amd-sev-snp@lists.suse.com, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 11, 2023 at 12:57=E2=80=AFPM Tom Lendacky <thomas.lendacky@amd.=
com> wrote:
>
> On 3/21/23 04:29, J=C3=B6rg R=C3=B6del wrote:
> > Hi,
> >
> > We are happy to announce that last week our secure VM service module
> > (SVSM) went public on GitHub for everyone to try it out and participate
> > in its further development. It is dual-licensed under the MIT and
> > APACHE-2.0 licenses.
> >
> > The project is written in Rust and can be cloned from:
> >
> >       https://github.com/coconut-svsm/svsm
> >
> > There are also repositories in the github project with the Linux host a=
nd
> > guest, EDK2 and QEMU changes needed to run the SVSM and boot up a full
> > Linux guest.
> >
> > The SVSM repository contains an installation guide in the INSTALL.md
> > file and contributor hints in CONTRIBUTING.md.
> >
> > A blog entry with more details is here:
> >
> >       https://www.suse.com/c/suse-open-sources-secure-vm-service-module=
-for-confidential-computing/
> >
> > We also thank AMD for implementing and providing the necessary changes
> > to Linux and EDK2 to make an SVSM possible.
>
> Just wanted to let everyone know that I'm looking into what we can do to
> move towards a single SVSM project so that resources aren't split between
> the two.
>
> I was hoping to have a comparison, questions and observations between the
> two available by now, however, I'm behind on that... but, I am working on=
 it.
>

This is a happy development. Glad to hear it and thanks for your work,
Tom, J=C3=B6rg, and all collaborators.

> Thanks,
> Tom
>
> >
> > Have a lot of fun!
> >



--=20
-Dionna Glaze, PhD (she/her)
