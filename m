Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com [136.143.188.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3F97B
	for <linux-coco@lists.linux.dev>; Fri, 21 Oct 2022 11:55:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1666353345; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gNIl7boS5Qc4lAVqu4JN8CD/jL6abIJLqyNUeRc+PZxRSfYtt9g+Pojd7TuNXnr8owk85zq1xZz7ImaZxNgFCkR8uX9qOu+flGWchLG9mxCVnv/Pf9CE2Kdr3TDbp5IRFMObkdLxlWyP/f9ccDjNb9Bcz+l/34AHZ8+QMet26mA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1666353345; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=Wh2ntXklaL0+hqLvXmVFA6blScSZQCPr7EOHKVlK2i0=; 
	b=Qw2Y44DZapXzGSyUMhxlcP8INJrVjVfYULIphK+m70as4i4zP+ifl+qYO07B12PaGSHMDwkp4Wu4kxX8g9JVLkGcRBBOqKyv+HLYGLWY4XrdhnT5d3ZqmY2edZMToc9wbAAmOJQ0B4nr/dyuUl1rEkYCKzD6jtoCUwVkIUJyijM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1666353345;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Wh2ntXklaL0+hqLvXmVFA6blScSZQCPr7EOHKVlK2i0=;
	b=sXV8FnWPDBa0cDTcIio9bxANk6HHyF55NdKUVEoa94/xicOrzi5asACi6JLDa0ba
	iEGUnK5W3/ehTVP2jIw/5mCQcxM3wki2e9G7oQO3AIHaVsXYbdPmdNf+ZDNGTg6Uhft
	eLcSbL+ldyPdgmDdNm0Q9Q55o+iMXxwID8/odeiQ=
Received: from [192.168.204.41] (035-130-112-162.biz.spectrum.com [35.130.112.162]) by mx.zohomail.com
	with SMTPS id 1666353342861727.3523928987597; Fri, 21 Oct 2022 04:55:42 -0700 (PDT)
Message-ID: <94f85fe8-4001-108d-1962-e2cd75ee0c36@apertussolutions.com>
Date: Fri, 21 Oct 2022 07:54:41 -0400
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: SVSM vTPM specification
Content-Language: en-US
To: jejb@linux.ibm.com, Tom Lendacky <thomas.lendacky@amd.com>,
 Stuart Yoder <stuart.yoder@arm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <3e11fa26-b644-c214-c8e8-492113523f95@amd.com>
 <Y0b6cDIMlKijT95S@work-vm>
 <b6b22a1f4741a29c68dbdfae59e3fb201e3aa5e8.camel@linux.ibm.com>
 <820ddc4a-ac48-00a1-d284-23d08899f1cc@amd.com>
 <294b08e11e53cff01607004737f6f20c6784c40b.camel@linux.ibm.com>
 <3474b28c-2de2-db95-9ecf-6b7c1a59d860@apertussolutions.com>
 <a77148556d530d6b6983d8fb1c6d8bdaf81cb695.camel@linux.ibm.com>
 <b51ea7a5-256e-5138-d956-ddacd4148f9c@apertussolutions.com>
 <ce89a3298963f4fa234e46ae9fe00da66e2ff819.camel@linux.ibm.com>
 <0a0f3b57-13c6-8161-8674-1dbcf3ca9ddc@arm.com>
 <a08770c2-c925-3f1a-cdb0-dc4bab5e42fe@amd.com>
 <485fd3eb-5547-6688-cb6f-007c0c08af2c@apertussolutions.com>
 <fb7d5aa64187daff6e61cdcfe7084a5eef7e0153.camel@linux.ibm.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <fb7d5aa64187daff6e61cdcfe7084a5eef7e0153.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External



On 10/16/22 12:44, James Bottomley wrote:
> On Sun, 2022-10-16 at 12:29 -0400, Daniel P. Smith wrote:
>> If enlightened guest/driver is acceptable, then why not adopt the
>> pv-vTPM protocol, Xen's vTPM driver, for which there is already a
>> driver present in the kernel, was designed for deep attestation, and
>> does not inhibit/block features such as locality?
> 
> Erm, because it requires the Xen bus for discovery and communication
> ... the KVM people might not be so keen on adding that.  The other
> problem, even if we were to write a virtio equivalent (which KVM
> doesn't have today because it relies on TIS or CRB emulations), is that
> for all these virtual drivers, the back endpoint is in the host and we
> want to terminate it in the SVSM, which is the guest.

This is why I stated protocol and not transport. The Xen paravirt vTPM 
protocol is designed to go over a shared memory buffer using a doorbell 
notification, ie the transport mechanism under consideration. In 
addition the protocol defined a series of non-standard TPM command 
ordinals to interact with vTPM, more to deal with deep attestation. This 
approach could be leverage to access localities instead of trying to 
mimic a capability designed more for register access using a doorbell 
which introduces the possibility of synchronicity issues. This work 
could then serve as a basis for a "Enlightened" vTPM TCG specification 
to enable cross-implementation compatibility.

> To be clear, the current KVM drivers do emulate localites, it's just
> that they're unused by the OS and Firmware.  If you look at the TPM
> emulators themselves, they have the concept of locality, but when they
> need it, they indirect via an additional platform call (in the ms-tpm,
> which the current IBM prototype uses, it's a stubbed call to
> __plat__LocalityGet/Set) ... the locality isn't provided as part of the
> main TPM command processor, which is why we don't need to worry about
> it in the initial prototype.  That means if anyone ever does figure out
> how to do dynamic launch for virtual machines, and requires localities,
> we can simply add handlers for the stub routines.

Just as a last little 2₵, I would just highlight that the Mobile CRB 
committee likely never considered that mobile processors like Arm would 
add a dynamic launch capability that would require the usage of 
localities. Yet today Arm now has a DRTM specification which is trying 
to deal with the fact that the Mobile CRB specification has no locality 
support. Sometimes making adjustments with forethought over expediency 
will save a lot of pain, like having to come up with migrations plans 
with minimal disruptions to customers because wholesale replacement of a 
solution becomes necessary for something that was known/raised at the 
beginning.

v/r,
dps

