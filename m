Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D312904
	for <linux-coco@lists.linux.dev>; Thu, 26 Jan 2023 16:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674751575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L3nQcNmdRGorn9KgNLnvALRVm9AenyaHCoSLw7WxkxU=;
	b=Muo43fZ/ySHWzLpJOqUNCTdID/dwRTNGgN4rRoNLowsEv/73wrOeM2VpWgo1NNt6lWbj5Z
	7LWmwuSVuhZEwFpnccq8lZPZAxIelC7f2YPs02tifXTfnRETYeCkl+4gpv3DUcFem3XBpZ
	d/NO3z4Pgp+vnhDqA1ZA4i65j8hklj0=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-132-9l6WFj0sNoaz8JMaD7nI9Q-1; Thu, 26 Jan 2023 11:46:14 -0500
X-MC-Unique: 9l6WFj0sNoaz8JMaD7nI9Q-1
Received: by mail-qv1-f72.google.com with SMTP id k15-20020a0cd68f000000b00535261af1b1so1346040qvi.13
        for <linux-coco@lists.linux.dev>; Thu, 26 Jan 2023 08:46:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qIoptHfTeUZKTnPWYHU2Hs1PW/WDQKBqt+a+VlCI4lw=;
        b=LOKVaoFwa2PihFle7aD4z3WcP+GnHSR/sfDRV05TLfzgVjhMIfvJI99KN6eDwYmbnN
         z+KcX/aEB+ooVGltuUmDorSHyRqQ2Yxp/Y2JUTN4pP0X0I1/jdX9rMybSkN3yqF0DUUd
         S/F/YxxhtohFFG/iynGtRE0XOY0T2gCCIqkF8WTKNBHUHmoUvuJ3iHcrkg4FAH6gXi9M
         P+dNuZurqgZc6wCFZglWfiPapa2THgo1zimBZ0NLjqWm+NKLs8guqBH3IXpLif7cpIOJ
         YToO7btAdRBrhk+rEdd39lkRgf5D+ZZPKfCgNjOePFJ7bcJVcOeNTNILnksq+0hUL/on
         W8uw==
X-Gm-Message-State: AFqh2ko4xvZQnQNcrTq5o5CiTDQc8aebkUon/xapsHaagneFcd6TCzCy
	HzVcLAkJTTVGiadegnbY6b0EmXDt7DGre0WEQn225iWpDN2zgATRHGoc7Analp5vxASoXNqgtWc
	4dsylhnmWSC8dsIEBb0RwRg==
X-Received: by 2002:ac8:6f09:0:b0:3b6:309e:dfde with SMTP id bs9-20020ac86f09000000b003b6309edfdemr62444073qtb.27.1674751573613;
        Thu, 26 Jan 2023 08:46:13 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtc4KiMOxgprCgTOSunWMVkOmcQPmE1J5V6v/dlXh60xtso/Pyj5sCH6q27kujTEcCwEOTL3A==
X-Received: by 2002:ac8:6f09:0:b0:3b6:309e:dfde with SMTP id bs9-20020ac86f09000000b003b6309edfdemr62444049qtb.27.1674751573331;
        Thu, 26 Jan 2023 08:46:13 -0800 (PST)
Received: from smtpclient.apple (82-65-201-253.subs.proxad.net. [82.65.201.253])
        by smtp.gmail.com with ESMTPSA id el5-20020a05622a430500b00343057845f7sm1020788qtb.20.2023.01.26.08.46.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Jan 2023 08:46:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.101.1.3\))
Subject: Re: SVSM Attestation and vTPM specification additions - v0.60
From: Christophe de Dinechin Dupont de Dinechin <cdupontd@redhat.com>
In-Reply-To: <dfca5ecb-b036-c9fd-f571-ec860f38eadb@amd.com>
Date: Thu, 26 Jan 2023 17:45:57 +0100
Cc: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>
Message-Id: <4AD5DDB4-9EBB-4933-8F8A-CCDBBF2FF07A@redhat.com>
References: <09819cb3-1938-fe86-b948-28aaffbe584e@amd.com>
 <Y8+mdnCrn7sNCcMt@suse.de> <dfca5ecb-b036-c9fd-f571-ec860f38eadb@amd.com>
To: Tom Lendacky <thomas.lendacky@amd.com>
X-Mailer: Apple Mail (2.3731.300.101.1.3)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable



> On 26 Jan 2023, at 15:36, Tom Lendacky <thomas.lendacky@amd.com> wrote:
>=20
> On 1/24/23 03:35, J=C3=B6rg R=C3=B6del wrote:
>> Hi,
>> On Tue, Jan 10, 2023 at 12:54:27PM -0600, Tom Lendacky wrote:
>>> Attached is an updated draft version of the SVSM specification with add=
ed
>>> support for an attestation protocol and a vTPM protocol as well as othe=
r
>>> miscellaneous changes (all identified by change bar). Please take a loo=
k and
>>> reply with any feedback you may have.
>> Thanks for putting this together, Tom! I think the review comments
>> which have been posted cover a good amount of improvements, but I'd like
>> to propose another addition:
>> It would be great if we have an equivalent to EBUSY in the return codes
>> to the guest. Something like SVSM_ERR_BUSY or SVSM_ERR_AGAIN, which
>> tells the guest that some resources needed to fulfill the request are
>> currently in-use and that the guest should try again later.
>> The reasoning here is that in a setup with multiple VCPUs one CPU does a
>> call to the SVSM which can take some time to complete (e.g. asking vTPM
>> to generate an RSA key) and then another VCPU comes along with a second
>> request to the vTPM. In that case the SVSM would have to busy-wait until
>> the other request is finished. I think it would be better to return to
>> the guest in this situation and try again later.
>> Thoughts?
>=20
> That certainly reasonable to add. I'll add SVSM_ERR_BUSY to the spec alon=
g with a statement that says the implementation of any protocol function ca=
n return this result code and, similar to another comment, that the functio=
n must be able to describe the progress made or be idempotent.
>=20
> Does anyone have any concerns over this?

Personally, I would welcome the addition. That would alleviate at least
one of my earlier concerns regarding multi-VCPU implementations.
Specifically that would make it somewhat easier for the caller to
detect contention, as opposed to having to try and predict it.

>=20
> Thanks,
> Tom
>=20
>> Regards,


