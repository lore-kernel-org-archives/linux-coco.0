Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3834D7471
	for <linux-coco@lists.linux.dev>; Thu, 19 Jan 2023 14:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674137159;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ugXNgqBtJPvWr4MA6JPsJP85cpDGY58i9mS6TsAsqUs=;
	b=BtESJ8VL+UP6ZJZFGrF0oB/0ES11R8zRUFgAAwvgEZekk0pco6sEpZ6gn5N3789I6ArXIY
	mQXSBmXS+A5f6byS4EfPU7PrVbnSG5aI5ayWrLGGg0yLiAXipnHIWzUuuQ+sCBghq9CDSJ
	WPxpzbljc7Mzl/xKFFS6iTRf7H7/rUk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-665-iHCRJQXdOYq_FLbBaS2hrA-1; Thu, 19 Jan 2023 09:05:57 -0500
X-MC-Unique: iHCRJQXdOYq_FLbBaS2hrA-1
Received: by mail-wr1-f72.google.com with SMTP id k18-20020adfb352000000b002bdd0a7a2b5so388490wrd.0
        for <linux-coco@lists.linux.dev>; Thu, 19 Jan 2023 06:05:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xBaiadbjt3CgbWtbdsTv1ZbRcElhiEsUfd9pG+658rw=;
        b=7uW7faIcQWvVF/niFgKPbiNulxQpxDplJbd5jXwVE3XtWofDP3hylbsksXxW9MqhAu
         p9vPYi5nk/yHHVS61vxchT58Lts7CgptaSykmK44Mug+7Mgdt3nVql8YbtgM0V28Glj0
         CSmrmLUdfpVKUvfUYC3vqseQSK1lmRwj+biRstbA6HDEOC2uC3cXqT46k/xgXxh+hQ0G
         GZkx68Iy3TW7GACAdHdYuqj1h2VLSaSYBtlAx6ohCCEQKhEN7ofxDvLEcd1dYjCYbdVx
         Ks4UsczDXmn8Mt4Yq/mLUg131fl0NX9tQ0KM5ZDXriBeCs4Gg9Bda7Q1Iz+oNeF9gVJi
         TvQg==
X-Gm-Message-State: AFqh2krjs1SC1UrOHtxI2me+XptQiYRgZ76UO34qQRXnGqA4cTcmH4y2
	AoxuUvvp35RzSYpCEbZoqwM9GO/PsRCl0RqnfTgRs4/jYCFH/UT47BL/JnAW4nQGZ16CE0luJmm
	X8Y3FWjB0MYzpoUdwNYOybw==
X-Received: by 2002:adf:e704:0:b0:2bd:d34e:534b with SMTP id c4-20020adfe704000000b002bdd34e534bmr8657386wrm.47.1674137154306;
        Thu, 19 Jan 2023 06:05:54 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsvGhJ9Zt9S0sZflVlvrMh4GNyGjIHJHENaYFzkk21ksGhOwt7DKpROrG/1LigSBLVD4VqiYw==
X-Received: by 2002:adf:e704:0:b0:2bd:d34e:534b with SMTP id c4-20020adfe704000000b002bdd34e534bmr8657325wrm.47.1674137153542;
        Thu, 19 Jan 2023 06:05:53 -0800 (PST)
Received: from smtpclient.apple ([2a01:e0a:834:5aa0:dcc2:1f2:1e47:e4e5])
        by smtp.gmail.com with ESMTPSA id j14-20020adff00e000000b0024cb961b6aesm33096256wro.104.2023.01.19.06.05.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Jan 2023 06:05:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.101.1.3\))
Subject: Re: SVSM initiated early attestation / guest secrets injection
From: Christophe de Dinechin Dupont de Dinechin <cdupontd@redhat.com>
In-Reply-To: <45f0dc31e61f111832f5da83dea6e1418deb3aee.camel@linux.ibm.com>
Date: Thu, 19 Jan 2023 15:05:42 +0100
Cc: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>,
 =?utf-8?B?IkRhbmllbCBQLiBCZXJyYW5nw6ki?= <berrange@redhat.com>,
 linux-coco@lists.linux.dev,
 amd-sev-snp@lists.suse.com
Message-Id: <17039966-2D3C-47F1-A5C3-82302CBD8D9D@redhat.com>
References: <Y8AbnM0cnKfXXW23@redhat.com> <Y8GTXpfqlOe53cEr@suse.de>
 <45f0dc31e61f111832f5da83dea6e1418deb3aee.camel@linux.ibm.com>
To: James Bottomley <jejb@linux.ibm.com>
X-Mailer: Apple Mail (2.3731.300.101.1.3)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable



> On 13 Jan 2023, at 19:02, James Bottomley <jejb@linux.ibm.com> wrote:
>=20
> On Fri, 2023-01-13 at 18:22 +0100, J=C3=B6rg R=C3=B6del wrote:
> [...]
>>         2. Host owner attaches a different disk image with malicious
>>            content, e.g. a boot loader that sends the secrets to the
>> host
>>            owner.
>=20
>=20
> This attack was discussed in the initial encrypted image prototype for
> SEV and SEV-ES.  The idea is that either the disk is encrypted with the
> injected encryption key (i.e. decodes correctly) or it isn't, in which
> case it's up to the mounting component (grub in the initial prototype
> and initrd in this proposal) to declare failure and destroy the
> secrets.

However, I recall discussions about the possibility that the host
owner could trigger a fallback back that mounts an *unencrypted*
disk successfully (or even discovers it). I remember discussions
on such cases with Daniel (about auto-discovery of boot partitions)
and Gerd (about fallback path for =E2=80=9Ccompatibility=E2=80=9D reasons).

So I believe that we need to clarify how we prevent the discovery
and mounting of non-encrypted partitions, no?

>=20
> In the original proposal, grub was combined with ovmf to produce
> attestation covering the mounting component.  In this new scheme, you
> could use measured direct boot to ensure that the initial attestation
> covers the initrd since the boot partition isn't encrypted.
>=20
> James
>=20
>=20

