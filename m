Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C45717EF
	for <linux-coco@lists.linux.dev>; Wed, 11 Jan 2023 09:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673428559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hOP4bBlq+7i4wZ+JPB7LQhc5vC0V78+foZ0CRi4H5pY=;
	b=Mee5kdh2Qx5G/NZQBr6s4vIl1pmqTQ6/HzNtg3RQG8+mNgHQP1++0hKzNPgRdFL9UZ/yOT
	yr+Deqsxf1JJFRwQqLKmdhmhmurxIBekK4aCR1OWo10Y9b7VUdkoGr/Avs0O7VLAgus7Q0
	0xzzqjcjXDBvYEKxxsaUERzIm/zqExo=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-617-BJyvwjjNNwKBVQG2sAj0BQ-1; Wed, 11 Jan 2023 04:15:57 -0500
X-MC-Unique: BJyvwjjNNwKBVQG2sAj0BQ-1
Received: by mail-qk1-f198.google.com with SMTP id x12-20020a05620a258c00b007051ae500a2so10532312qko.15
        for <linux-coco@lists.linux.dev>; Wed, 11 Jan 2023 01:15:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BE1FLYGcIvqG2d1qwBpmXV1WaLN0vIoDyy0je9P5Mxo=;
        b=mcCTAgxQDB0T61/5ZKsbVOGo5h0pChI+U6DbYD7Pqs0CJY41j+dL0PkO5kVZjQkzvH
         CFKdL9SYgxU9J7fj5ycw50psnqBaJlxcaTMCaTlJZIh3j7jiNdW5I4OuspV3ZpMU8eYp
         8VXrf3JL283bPmxzIC6RqxHWZ2qCLsmlVMgJdkUhGDoWP1bOdmg9gK/hIW0hl1TI/Xqx
         6gVPddLop7PfgLp5WVCH8Rr4IJg/jRS+znEgo5nLMvujkcelY1hzq1aZlRiA9SdG/NyB
         fxSTZQXTw+6j71YRTbwkSTCMO/mONBhrqvNQdH40sj2P9Bp2jqSTNo6VoE2CTdcHYt4s
         jKCQ==
X-Gm-Message-State: AFqh2kqZmnUaUrmxsuO0d62boSy6vX+t6LvUyPJnTBQHcj+wRROT+PWV
	A8rM3B9Udr2ezaaHiftpuGvdD6A4HNWXdqm3/MemVyCLhA6nm4G6dc+hJ/ExoxO02sM8iU2J/q5
	Q0PlfRvDIjTw6NlT/AOiFzQ==
X-Received: by 2002:a05:622a:488e:b0:3ab:6e0c:16b1 with SMTP id fc14-20020a05622a488e00b003ab6e0c16b1mr92200982qtb.45.1673428557295;
        Wed, 11 Jan 2023 01:15:57 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvo6inj3NtUIjX2hdFYo5Z9btS7qPfhtD5/y99EUzsDH81vrsPPsNhV4tXGQNl7tUMMxWgJfQ==
X-Received: by 2002:a05:622a:488e:b0:3ab:6e0c:16b1 with SMTP id fc14-20020a05622a488e00b003ab6e0c16b1mr92200969qtb.45.1673428557001;
        Wed, 11 Jan 2023 01:15:57 -0800 (PST)
Received: from smtpclient.apple ([2a01:e0a:834:5aa0:f57b:e209:9e3a:40eb])
        by smtp.gmail.com with ESMTPSA id fx11-20020a05622a4acb00b003a6934255dasm7325718qtb.46.2023.01.11.01.15.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Jan 2023 01:15:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.101.1.3\))
Subject: Re: SVSM Attestation and vTPM specification additions - v0.60
From: Christophe de Dinechin Dupont de Dinechin <cdupontd@redhat.com>
In-Reply-To: <851632f85278dad75a5bdc944cbe616a86ae4e18.camel@linux.ibm.com>
Date: Wed, 11 Jan 2023 10:15:44 +0100
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Dionna Amalie Glaze <dionnaglaze@google.com>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>
Message-Id: <D8B3D21C-F1A4-42AD-96D1-CD21F5D4437B@redhat.com>
References: <09819cb3-1938-fe86-b948-28aaffbe584e@amd.com>
 <CAAH4kHa_DN2e4DreB_PfUEsu7KrB64=m5=-HnH+WpnmecoRz3g@mail.gmail.com>
 <804079b5-c090-af4b-ecca-839ab8bea0f7@amd.com>
 <82e9126149127c11a09bf031125edf2ee72a7a26.camel@linux.ibm.com>
 <09079dc6-e0b0-85d8-34df-575e576e6c47@amd.com>
 <851632f85278dad75a5bdc944cbe616a86ae4e18.camel@linux.ibm.com>
To: James Bottomley <jejb@linux.ibm.com>
X-Mailer: Apple Mail (2.3731.300.101.1.3)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable



> On 11 Jan 2023, at 00:52, James Bottomley <jejb@linux.ibm.com> wrote:
>=20
> On Tue, 2023-01-10 at 16:45 -0600, Tom Lendacky wrote:
>> On 1/10/23 16:14, James Bottomley wrote:
> [...]
>>> consumers can access all localities without restriction locality
>>> becomes a totally useless thing.  To give a meaning to locality,
>>> you have to have some restrictions about how components can access
>>> it. The only current user of localities I know is dynamic launch
>>> and that's usually done by restricting locality 4 to the CPU
>>> microcode in a physical system.
>>>=20
>>> Until we can agree what dynamic launch (or some other locality
>>> consumer) might mean in a confidential VM (and that the SVSM can
>>> police it) there's no real point wiring locality up in the linux
>>> kernel driver.  I mean the linux kernel itself doesn't use
>>> localities either, it just sets them to 0 unless the TPM indicates
>>> a different default value.
>>>=20
>>> If we do find a use for localites, whatever we use them for would
>>> be described by TPM event log entries, so there would be no need of
>>> a new versioned SVSM call.
>>=20
>> I think there would be, though. Right now the call says any non-zero=20
>> locality value returns an error because, as you alluded, there is no=20
>> policing by the SVSM. The API suddenly starting to support non-zero=20
>> localities breaks the API, no?
>=20
> Right, but that makes it a doctor it hurts problem.  Just because we
> currently don't know how we'd police locality in the SVSM doesn't mean
> an OS upward of us can't.

+1.

>  For instance the current argument about
> hibernate keys could be solved by making the linux kernel access the
> TPM at a different locality from the one it exposes to user space, so
> creation data would definitively tell us if the kernel or a user
> created a given TPM key.  Hmm, perhaps I should wire up locality in the
> driver ... so the kernel can set it, then we won't fail unexpectedly if
> a kernel use case actually comes along.=20

But then you=E2=80=99d need some kind of test case to exercise that path,
otherwise chances are it won=E2=80=99t be accepted.

The use case you just described (user-space vs. kernel locality)
looks like it would need to be implemented to justify the wiring
in the driver, no?

>=20
> James
>=20
>=20

