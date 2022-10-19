Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1EE23A7
	for <linux-coco@lists.linux.dev>; Wed, 19 Oct 2022 05:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666158466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TKc2Q9arEpg/4CdAPnO49yltd8SF+V7OEfHdz121TrA=;
	b=QHyqJwxaoeJ1MWuflJQ3UN3KwbU+YYziOMXCGI21U1ZG+fn1lqPAppmCK8iGqSN5zYo+GV
	OXWEo58U1WIPZPLD3iWaFxuqCkJBOz7+KEN+m69FbfYHzf/Xx8Gad9s7mWVIx5ewMJIubc
	mqCYlB3Kp5n8PbmSlxu9Qllf1NJa41U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-606-xXsvXSsqO8ORpYK20HxKsw-1; Wed, 19 Oct 2022 01:47:45 -0400
X-MC-Unique: xXsvXSsqO8ORpYK20HxKsw-1
Received: by mail-wm1-f72.google.com with SMTP id c130-20020a1c3588000000b003b56be513e1so10354713wma.0
        for <linux-coco@lists.linux.dev>; Tue, 18 Oct 2022 22:47:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mDMb+QGFMhWPO7syvhsNQ6vAlGWCWf8MGS1tfoB/URg=;
        b=orKLNyM8pTwwFzlmEvnC8z1kRBEPMV4OHa6d88rblD9sd6YbJWGKXBVFnTyfSM7XTh
         KhpDAIcOJnJH24s+visHcc8QafovRiYXnmGXtKw6VJYS3ACCv7M8lEtu5qOAQtF7RVgW
         5DvLtQrs6AtNytEJ4JIwdtldRlaklUyl6HLBFLZQHcLZaYTsg+ZAXgi9bbv3cLPjNsgm
         +cen9lnVz3peOXqNXbNxOZeAUZON5XVP6oWqHmdNCpkAudE9CEl8za+SXd0RGwkQz/F0
         EWVSKSiHICph4KA7DwF+wdTCz0dL3Qm7ymex6F5599S71z5kn+doU/KAiGIQ7c1e+gfr
         s/mA==
X-Gm-Message-State: ACrzQf3y6rXvUxhjYk7yQFSuo8iOyxukZgsXe3IBUFRHRKwHjSTENTQH
	J4NouDmSj9eYhAdvWnSKZ0tVt8B4GRqAGsN1wsQHQJrLbCvBVBlipDB6v4fxCkg5ykG3q2grGAU
	tHoo0p3PeKXXkmjUUBqxGmw==
X-Received: by 2002:a05:600c:35cc:b0:3c6:fb3b:2075 with SMTP id r12-20020a05600c35cc00b003c6fb3b2075mr7389231wmq.86.1666158463347;
        Tue, 18 Oct 2022 22:47:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM53DXjnD+yr4XfeDbHmqVyDJCHxJYMlxOrOTkT+6soJNVxNogjhAOLG9+Dg6xLhQCF6z9x3XA==
X-Received: by 2002:a05:600c:35cc:b0:3c6:fb3b:2075 with SMTP id r12-20020a05600c35cc00b003c6fb3b2075mr7389219wmq.86.1666158463008;
        Tue, 18 Oct 2022 22:47:43 -0700 (PDT)
Received: from smtpclient.apple ([2a01:e0a:834:5aa0:2dca:b9bb:3ae8:b742])
        by smtp.gmail.com with ESMTPSA id m2-20020adfe0c2000000b0022e6178bd84sm13245463wri.8.2022.10.18.22.47.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Oct 2022 22:47:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: SVSM vTPM specification
From: Christophe de Dinechin <cdupontd@redhat.com>
In-Reply-To: <155c7303-3027-7d93-263f-f42ea159f855@linux.ibm.com>
Date: Wed, 19 Oct 2022 07:47:41 +0200
Cc: jejb@linux.ibm.com,
 Tom Lendacky <thomas.lendacky@amd.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Message-Id: <679C87ED-6D21-4D0A-9537-9910A6F802ED@redhat.com>
References: <3e11fa26-b644-c214-c8e8-492113523f95@amd.com>
 <Y0b6cDIMlKijT95S@work-vm>
 <a23e15cda00ee6a1c15f0d499deffd38b0593a78.camel@linux.ibm.com>
 <b5a2985a-3717-7d4b-0c8a-52fdcbc7c6b7@amd.com>
 <58caad5df212e620c6840f2c2f16514674893dfa.camel@linux.ibm.com>
 <155c7303-3027-7d93-263f-f42ea159f855@linux.ibm.com>
To: Dov Murik <dovmurik@linux.ibm.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable



> On 18 Oct 2022, at 22:22, Dov Murik <dovmurik@linux.ibm.com> wrote:
>=20
>=20
>=20
> On 13/10/2022 18:30, James Bottomley wrote:
>> On Thu, 2022-10-13 at 10:14 -0500, Tom Lendacky wrote:
>>> On 10/12/22 13:44, James Bottomley wrote:
>>>> On Wed, 2022-10-12 at 18:33 +0100, Dr. David Alan Gilbert wrote:
>>>>> * Tom Lendacky (thomas.lendacky@amd.com) wrote:
>>>> [...]
>>>>> It's important that the VMPL level in the attestation report
>>>>> reflects the side asking for the attestation; in particular one
>>>>> TPM story goes that the firmware (in VMPL0) would ask for an
>>>>> attestation and the attestor would return the vTPM stored
>>>>> state.  It's important that the state could only be returned to
>>>>> the vTPM not the guest, so the attestor would check that the VMPL
>>>>> level in the attestation was 0; any guest attestation would have
>>>>> a VMPL>0 and so the attestor wouldn't hand it the vTPM state.
>>>>> Hmm or are you saying such a report would be triggered by the
>>>>> guest rather than the firmware, but it would be protected by
>>>>> VMPCK0 so the guest wouldn't be able to read it?
>>>=20
>>> No, the VMPCK0 key is just used for communication with the PSP.
>>>=20
>>> While the SVSM would request the attestation report from the PSP,
>>> the guest would need to request it from the SVSM.
>>=20
>> I think this is fine.  The SVSM would do the attestation as it starts
>> the TPM but the guest would be able to retrieve it at any time.=20
>> Essentially, if you use something like keylime, the agent would request
>> it on start up to prove it should trust the vTPM, but that could occur
>> way after VM boot.
>>=20
>>>=20
>>>>> I think one of the vTPMs keys should be in the SNP attestation
>>>>> report (the EK???) - I think that would allow you to attest that
>>>>> the vTPM you're talking to is a vTPM running in an SNP protected
>>>>> firmware.
>>>>=20
>>>> Traditionally the TPM identity is the public EK, so that should
>>>> definitely be in the report.  Ideally, I think the public storage
>>>> root key (key derived from the owner seed) should be in there two
>>>> because it makes it easy to create keys that can only be read by
>>>> the TPM (keys should be in the owner hierarchy which means they
>>>> have to be encrypted to the storage seed, so we need to know what a
>>>> public key corresponding to it is).
>>>>=20
>>>> One wrinkle of the above is that, when provisioned, the TPM will
>>>> only have the seeds, not the keys (the keys are derived from the
>>>> seeds via a TPM2_CreatePrimary command).  The current TPM
>>>> provisioning guidance:
>>>>=20
>>>> https://trustedcomputinggroup.org/resource/tcg-tpm-v2-0-provisioning-g=
uidance/
>>>>=20
>>>> Says that the EK should be at permanent handle
>>>>=20
>>>> 81010001
>>>>=20
>>>> And there's an update saying that should be the RSA-2048 key and
>>>> there should be an EC (NIST-P256) one at 81010002.  The
>>>> corresponding storage keys should be at 81000001 and 81000002
>>>> respectively.  I think when the SVSM provisions the TPM, it should
>>>> run TPM2_CreatePrimary for those four keys and put them into the
>>>> persistent indexes, then insert the EC keys only for EK and SRK
>>>> into the attestation report.
>>>=20
>>> We only have 512 bits to work with for the SVSM-provided data, so
>>> would hashes of the keys be ok?
>>=20
>> Well, if you put the hashes in, the consuming entity would then have to
>> find out via an additional channel what the actual keys were because
>> you can't reverse the hash (it's possible, just more effort).  If you
>> use point compression, an EC key (for the NIST p-256 curve) is only 32
>> bytes anyway, so it's the same size as a sha256 hash, so I'd say place
>> the actual public keys into the report to give complete and usable
>> information
>>=20
>=20
> Do we need to leave room for a Guest-Owner-provided nonce?  Guest owner
> will provide it to the guest OS which will provide it to the SVSM to be
> included in REPORT_DATA of the VMPL0 attestation report.
>=20
I think it=E2=80=99s a good idea, but I=E2=80=99m not clear on which compon=
ent in the
guest would be responsible for that exchange.

You need a functioning networking stack, and you need a way to know what
attestation server to talk to.

IIUC, at this stage, we have no valid storage yet, since that would
require having received the response from the attestation server.
So the only storage we have is host storage managed by the hypervisor,
plus whatever fits in your SVSM-provided data.

Can we send this data without additional encryption since it=E2=80=99s alre=
ady
cyphertext? Or do we want additional mechanisms, and if so, what root
certificates do we use? Where do we get them from without guest storage?

Do we rely on guest networking being up at that point? Or do we need
to provide additional mechanisms in the hypervisor to perform this
initial exchange on behalf of the guest?



> If we don't add a nonce not, how can the guest owner verify the
> freshness of the report?  Maybe the pub-EK is enough because it signs
> the rest of the TPM-report and the guest-owner can somehow verify its
> freshness?

I think that would work for transient vTPMs. If we want a long-lived
vTPM, then we=E2=80=99d need a mechanism for the guest owner to tell, ahead=
 of
time, when to regenerate a new vTPM state, and to independently get
that state. In that case, the policy of when to update the vTPM state
would be deferred to some external server, and the process would be:

- Day 1: External server requests a new TPM state, stores state
- Day N: Guest boots, uses that TPM state, which is then verified
  by the external server
- Day M: External server decides to refresh the TPM state, will now
  only accept boots with fresher state


>=20
>=20
> It looks like REPORT_DATA needs to be
>=20
> SHA512(guest_owner_nonce || pub_EK || pub_SRK)
>=20
> And the guest does this:
>=20
> 1. Receive nonce from guest owner
> 2. Calls SVSM_GET_TPM_PUB_KEYS
> 3. Constructs report_data=3Dsha512(guest_owner_nonce || pub_EK || pub_SRK=
)
> 4. Calls SVSM_GET_SNP_ATTESTATION_REPORT(report_data)
> 5. Send back both the report and pub_* to guest owner
>=20
>=20
> -Dov

