Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFC428E8
	for <linux-coco@lists.linux.dev>; Wed, 19 Oct 2022 11:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666178515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ao5o+W9qFWQdIeSmWCeYOYCK8cnRtd8K8BjiH0EjSCk=;
	b=N5b2+X7WfIQ7w58HHIebf1bHFCIxrGdzZT4L4b7hqt5hixnLmKB+cixkPuj08ScGolLxB2
	x0P6tIPrISMNakzpcX0X5VJPpdDBgRBmM7V9bKwtVs0BBu5lcO3fXFD1JEW0wPtAke+wmf
	MDgnfKHVlU0DRQYf5f5zcQR5eagJVdk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-619-4Cbiek1XOJCEzpwueR1ACw-1; Wed, 19 Oct 2022 07:21:54 -0400
X-MC-Unique: 4Cbiek1XOJCEzpwueR1ACw-1
Received: by mail-wm1-f69.google.com with SMTP id k22-20020a05600c0b5600b003c6cf5c5592so7784625wmr.3
        for <linux-coco@lists.linux.dev>; Wed, 19 Oct 2022 04:21:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ao5o+W9qFWQdIeSmWCeYOYCK8cnRtd8K8BjiH0EjSCk=;
        b=BYx11OESTcCYSR1BDWNNfpZIhBmxhikVfeaYndbrn9CA5uE7pK/0trfPzW+FngMLaK
         zW8LTLwWFvFv5C8/dlriA9q0qV+rDv2MrCb8rSZ3FejgD4F7Z1N3UNws7zi7JO8pJIsC
         aSmMf9/g7v8YU9fxi5BuFG2kfp+BfixU/dptLcAtRuQYGJ7d+KtPpqkiIYqSNdBrPLBO
         zqqNPWf7WKJQXkpgeaOn56q25bqCzrxmLs6ner678pK4NvzP5hQwHGs9D0J2EX95A0fM
         ZjbyuYTfJA+SLPix9DqVTydtDDp+4ehb5bDRtSUhQK+Onap8AhDgh3v4enSXwC7xPFIg
         DeLA==
X-Gm-Message-State: ACrzQf08RrbBjfuBQbVXQMskdge4iPJtkwMOEz5gOfp4q62oU6PqOMDb
	yl9x2IOc9aQdx+e/7n6VHGaKtON4uxf22Rd4+Ibfaj3rmOolVzeWNr+iDMBKWD1RP3JAIjrglHL
	Wz274tSy9+dBaIsFakH04pA==
X-Received: by 2002:adf:fb43:0:b0:22b:64:8414 with SMTP id c3-20020adffb43000000b0022b00648414mr4875962wrs.70.1666178512804;
        Wed, 19 Oct 2022 04:21:52 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5Kwaf9CHvPGSdyrT2RHsDSGZUChq0Y7APr9fM5/4Hrtsf4lHZfvaeZk22OmoKVGuvo2NA+4g==
X-Received: by 2002:adf:fb43:0:b0:22b:64:8414 with SMTP id c3-20020adffb43000000b0022b00648414mr4875938wrs.70.1666178512443;
        Wed, 19 Oct 2022 04:21:52 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net. [82.30.61.225])
        by smtp.gmail.com with ESMTPSA id t9-20020a05600c198900b003b4fe03c881sm22334218wmq.48.2022.10.19.04.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 04:21:51 -0700 (PDT)
Date: Wed, 19 Oct 2022 12:21:50 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Christophe de Dinechin <cdupontd@redhat.com>
Cc: Dov Murik <dovmurik@linux.ibm.com>, jejb@linux.ibm.com,
	Tom Lendacky <thomas.lendacky@amd.com>,
	"amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Subject: Re: SVSM vTPM specification
Message-ID: <Y0/dzjGHnLUFgDQP@work-vm>
References: <3e11fa26-b644-c214-c8e8-492113523f95@amd.com>
 <Y0b6cDIMlKijT95S@work-vm>
 <a23e15cda00ee6a1c15f0d499deffd38b0593a78.camel@linux.ibm.com>
 <b5a2985a-3717-7d4b-0c8a-52fdcbc7c6b7@amd.com>
 <58caad5df212e620c6840f2c2f16514674893dfa.camel@linux.ibm.com>
 <155c7303-3027-7d93-263f-f42ea159f855@linux.ibm.com>
 <679C87ED-6D21-4D0A-9537-9910A6F802ED@redhat.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <679C87ED-6D21-4D0A-9537-9910A6F802ED@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

* Christophe de Dinechin (cdupontd@redhat.com) wrote:
> 
> 
> > On 18 Oct 2022, at 22:22, Dov Murik <dovmurik@linux.ibm.com> wrote:
> > 
> > 
> > 
> > On 13/10/2022 18:30, James Bottomley wrote:
> >> On Thu, 2022-10-13 at 10:14 -0500, Tom Lendacky wrote:
> >>> On 10/12/22 13:44, James Bottomley wrote:
> >>>> On Wed, 2022-10-12 at 18:33 +0100, Dr. David Alan Gilbert wrote:
> >>>>> * Tom Lendacky (thomas.lendacky@amd.com) wrote:
> >>>> [...]
> >>>>> It's important that the VMPL level in the attestation report
> >>>>> reflects the side asking for the attestation; in particular one
> >>>>> TPM story goes that the firmware (in VMPL0) would ask for an
> >>>>> attestation and the attestor would return the vTPM stored
> >>>>> state.  It's important that the state could only be returned to
> >>>>> the vTPM not the guest, so the attestor would check that the VMPL
> >>>>> level in the attestation was 0; any guest attestation would have
> >>>>> a VMPL>0 and so the attestor wouldn't hand it the vTPM state.
> >>>>> Hmm or are you saying such a report would be triggered by the
> >>>>> guest rather than the firmware, but it would be protected by
> >>>>> VMPCK0 so the guest wouldn't be able to read it?
> >>> 
> >>> No, the VMPCK0 key is just used for communication with the PSP.
> >>> 
> >>> While the SVSM would request the attestation report from the PSP,
> >>> the guest would need to request it from the SVSM.
> >> 
> >> I think this is fine.  The SVSM would do the attestation as it starts
> >> the TPM but the guest would be able to retrieve it at any time. 
> >> Essentially, if you use something like keylime, the agent would request
> >> it on start up to prove it should trust the vTPM, but that could occur
> >> way after VM boot.
> >> 
> >>> 
> >>>>> I think one of the vTPMs keys should be in the SNP attestation
> >>>>> report (the EK???) - I think that would allow you to attest that
> >>>>> the vTPM you're talking to is a vTPM running in an SNP protected
> >>>>> firmware.
> >>>> 
> >>>> Traditionally the TPM identity is the public EK, so that should
> >>>> definitely be in the report.  Ideally, I think the public storage
> >>>> root key (key derived from the owner seed) should be in there two
> >>>> because it makes it easy to create keys that can only be read by
> >>>> the TPM (keys should be in the owner hierarchy which means they
> >>>> have to be encrypted to the storage seed, so we need to know what a
> >>>> public key corresponding to it is).
> >>>> 
> >>>> One wrinkle of the above is that, when provisioned, the TPM will
> >>>> only have the seeds, not the keys (the keys are derived from the
> >>>> seeds via a TPM2_CreatePrimary command).  The current TPM
> >>>> provisioning guidance:
> >>>> 
> >>>> https://trustedcomputinggroup.org/resource/tcg-tpm-v2-0-provisioning-guidance/
> >>>> 
> >>>> Says that the EK should be at permanent handle
> >>>> 
> >>>> 81010001
> >>>> 
> >>>> And there's an update saying that should be the RSA-2048 key and
> >>>> there should be an EC (NIST-P256) one at 81010002.  The
> >>>> corresponding storage keys should be at 81000001 and 81000002
> >>>> respectively.  I think when the SVSM provisions the TPM, it should
> >>>> run TPM2_CreatePrimary for those four keys and put them into the
> >>>> persistent indexes, then insert the EC keys only for EK and SRK
> >>>> into the attestation report.
> >>> 
> >>> We only have 512 bits to work with for the SVSM-provided data, so
> >>> would hashes of the keys be ok?
> >> 
> >> Well, if you put the hashes in, the consuming entity would then have to
> >> find out via an additional channel what the actual keys were because
> >> you can't reverse the hash (it's possible, just more effort).  If you
> >> use point compression, an EC key (for the NIST p-256 curve) is only 32
> >> bytes anyway, so it's the same size as a sha256 hash, so I'd say place
> >> the actual public keys into the report to give complete and usable
> >> information
> >> 
> > 
> > Do we need to leave room for a Guest-Owner-provided nonce?  Guest owner
> > will provide it to the guest OS which will provide it to the SVSM to be
> > included in REPORT_DATA of the VMPL0 attestation report.
> > 
> I think it’s a good idea, but I’m not clear on which component in the
> guest would be responsible for that exchange.

Hang on; we're mixing a few levels here.

To go back to Dov's question; the only reason to worry about 'leaving
room' for a nonce is James's idea of including actual keys and taking
all the space up.  IMHO that sounds delicate, and dependent on the key
type etc - where as if you include a hash, then you can mix a nonce in
as well.

> You need a functioning networking stack, and you need a way to know what
> attestation server to talk to.
> 
> IIUC, at this stage, we have no valid storage yet, since that would
> require having received the response from the attestation server.
> So the only storage we have is host storage managed by the hypervisor,
> plus whatever fits in your SVSM-provided data.
> 
> Can we send this data without additional encryption since it’s already
> cyphertext? Or do we want additional mechanisms, and if so, what root
> certificates do we use? Where do we get them from without guest storage?
> 
> Do we rely on guest networking being up at that point? Or do we need
> to provide additional mechanisms in the hypervisor to perform this
> initial exchange on behalf of the guest?

One question is :

  'When is the first time we need to use any of the stored
   keys or policy in the vTPM'

because as long as we don't need stored TPM state until later in the
boot process, we don't need to perform the attestation/load of the vTPM
state until then;  we *do* need to maintain the PCRs from startup,
but everything else can wait.    With SNP I think we can hold off doing
the attestation until that later point?

Perhaps that means we can wait until EFI is up to actually do the load
of the vTPM state?

Dave

> 
> 
> > If we don't add a nonce not, how can the guest owner verify the
> > freshness of the report?  Maybe the pub-EK is enough because it signs
> > the rest of the TPM-report and the guest-owner can somehow verify its
> > freshness?
> 
> I think that would work for transient vTPMs. If we want a long-lived
> vTPM, then we’d need a mechanism for the guest owner to tell, ahead of
> time, when to regenerate a new vTPM state, and to independently get
> that state. In that case, the policy of when to update the vTPM state
> would be deferred to some external server, and the process would be:
> 
> - Day 1: External server requests a new TPM state, stores state
> - Day N: Guest boots, uses that TPM state, which is then verified
>   by the external server
> - Day M: External server decides to refresh the TPM state, will now
>   only accept boots with fresher state
> 
> 
> > 
> > 
> > It looks like REPORT_DATA needs to be
> > 
> > SHA512(guest_owner_nonce || pub_EK || pub_SRK)
> > 
> > And the guest does this:
> > 
> > 1. Receive nonce from guest owner
> > 2. Calls SVSM_GET_TPM_PUB_KEYS
> > 3. Constructs report_data=sha512(guest_owner_nonce || pub_EK || pub_SRK)
> > 4. Calls SVSM_GET_SNP_ATTESTATION_REPORT(report_data)
> > 5. Send back both the report and pub_* to guest owner
> > 
> > 
> > -Dov
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

