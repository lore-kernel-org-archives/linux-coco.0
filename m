Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EE846A7
	for <linux-coco@lists.linux.dev>; Thu, 26 Jan 2023 16:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674751764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k9bvG/d4YiWwykJwc6y9wkjVbkRxHz3Yo+tx8kbz+aM=;
	b=QYxunHDBkNYXkaMamdTwIiIcCWol9TDh0XMhsuRbCtj6yoY6BWo8mSIVrvwPngQgt51Bhc
	YHa7xExHjnHtUfR74NukGRZC3MuNh6Tw+0SO6Xt7m/ugm3eSONqUKnrrNfyS1cCky2AdAs
	whewZJtGT08CvJcOS8w1yG/K1adVCqI=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-554-7bvGl_ZeM3uCFW7_QTgXSA-1; Thu, 26 Jan 2023 11:49:23 -0500
X-MC-Unique: 7bvGl_ZeM3uCFW7_QTgXSA-1
Received: by mail-qv1-f71.google.com with SMTP id f16-20020ad442d0000000b005376362aa66so1359960qvr.1
        for <linux-coco@lists.linux.dev>; Thu, 26 Jan 2023 08:49:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x3dSmvAshfvKF8fydZPo1NPiekhDSkaG4NO3LQ9uQmg=;
        b=WPsgXpk81EWXetczjUMW5bNvWOSMY/wPkfEtIjzXuGnKbx5+uwXBepaPqHQASO8cAJ
         zuyQ2bAIDgIvxNIgrm7navckfo4lIOy+mSPrB55tJEfYl2QWDibtZFYzQDpu8lrpg9p0
         nbr/Cdr2zwyThDp4Dtnb+Oxd/qP+y+kg/W27yxcc/9SQetoSLLfZfjpM1SuDQxxENJFY
         OF40gRBh6oIukZI5MHhaXaG1/dhQUeT9+oq6kWKIfnSkLhwS9qy/KPn7hP3dXsPwbV2j
         ZvitK7JCO6oijG8DOz9RKdqyvkQckxcNssed884flGZhCE4KYuX9sEKRwsMcMMnc08Ys
         bNqw==
X-Gm-Message-State: AFqh2kqs3Ey6Hmz2WI6DOTxi3YnasRvGp0Ev0JUqvjVg4eKHJaDWiSfe
	8fgZCAWEjffHpurSS42sUn0f3PemJHhVlUquvNhL4HtyKNidfl9klHTw17kbC7rayozeiUqEGqL
	JzVTr90TV9VpT4njtjgyiag==
X-Received: by 2002:a05:622a:5917:b0:3a8:175a:fd48 with SMTP id ga23-20020a05622a591700b003a8175afd48mr57842161qtb.64.1674751762589;
        Thu, 26 Jan 2023 08:49:22 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtJ82qMfIWAxzXHNolQUO0xl1ljZSvrTLJcTdnIiALMUbXmVs/Ijt+Y3OPtmDs2f44Folc7Zw==
X-Received: by 2002:a05:622a:5917:b0:3a8:175a:fd48 with SMTP id ga23-20020a05622a591700b003a8175afd48mr57842142qtb.64.1674751762307;
        Thu, 26 Jan 2023 08:49:22 -0800 (PST)
Received: from smtpclient.apple (82-65-201-253.subs.proxad.net. [82.65.201.253])
        by smtp.gmail.com with ESMTPSA id 6-20020a05620a070600b006fcb77f3bd6sm1169986qkc.98.2023.01.26.08.49.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Jan 2023 08:49:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.101.1.3\))
Subject: Re: SVSM Attestation and vTPM specification additions - v0.60
From: Christophe de Dinechin Dupont de Dinechin <cdupontd@redhat.com>
In-Reply-To: <7398c541-78ac-670f-1f4c-92b7525ed99e@amd.com>
Date: Thu, 26 Jan 2023 17:49:08 +0100
Cc: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>
Message-Id: <749A53E5-4C6E-4D89-AF9B-E9F5EA273E1B@redhat.com>
References: <09819cb3-1938-fe86-b948-28aaffbe584e@amd.com>
 <Y8+oqoU2jZYrNlz1@suse.de> <7398c541-78ac-670f-1f4c-92b7525ed99e@amd.com>
To: Tom Lendacky <thomas.lendacky@amd.com>
X-Mailer: Apple Mail (2.3731.300.101.1.3)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable



> On 26 Jan 2023, at 15:51, Tom Lendacky <thomas.lendacky@amd.com> wrote:
>=20
> On 1/24/23 03:45, J=C3=B6rg R=C3=B6del wrote:
>> On Tue, Jan 10, 2023 at 12:54:27PM -0600, Tom Lendacky wrote:
>>> Attached is an updated draft version of the SVSM specification with add=
ed
>>> support for an attestation protocol and a vTPM protocol as well as othe=
r
>>> miscellaneous changes (all identified by change bar). Please take a loo=
k and
>>> reply with any feedback you may have.
>> Another addition I'd like to propose:
>> It would be nice to have a protocol number reserved for implementation
>> specific requests. The protocol number only defines one standardized
>> request to identify the specific SVSM implemenation in use. Other
>> requests are implementation specific and can be used to manage the SVSM
>> from the guest.
>=20
> Would returning an implementation GUID as part of SVSM_CORE_QUERY_PROTCOL=
 or adding a SVSM_CORE_GET_IMPLEMENTATION call to the core protocol be bett=
er? Then we could reserve a range of protocols for use SVSM implementation =
specific protocols as opposed to just one. Since the protocol ID is 32-bits=
, maybe make 0x8000_0000 to 0x8FFF_FFFF be SVSM implementation specific.
>=20
> Which would folks prefer? A new protocol to retrieve the implementation, =
modify SVSM_CORE_QUERY_PROTCOL or add SVSM_CORE_GET_IMPLEMENTATION to the c=
ore protocol?
>=20
> Or any strong feelings about why this wouldn't be good?

Intuitively, I have a slight preference for the reserved range. It is the s=
implest to understand, has a larger potential for an implementation encodin=
g some info in the protocol, and also means that testing for it can be stat=
ic (on both sides).

>=20
> Thanks,
> Tom
>=20
>> One use-case would be, for example, to read the SVSM log buffer from the
>> guest side, but depending on the implementation there could be more
>> requests defined.
>> Regards,


