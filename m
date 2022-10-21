Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3478F5E
	for <linux-coco@lists.linux.dev>; Fri, 21 Oct 2022 12:31:24 +0000 (UTC)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29LCIWRI040036;
	Fri, 21 Oct 2022 12:31:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=TWaXiHFx1TQMpvTpwxGbLd0FcacMsU5rQNyKlRckNVw=;
 b=oMDcQdQQxiC4qvnWJXvHh8fL7mg9FTfuHuN+l7lw8qLp8zhxD8Zo0i/LJOvV3B9dV775
 b27GVpmE+R7765hlBa0TTL5x9XzEB10vpxL0oG5ZM7pTyExBQU746BjVSzpn3Pzsaj5q
 Wl1xT+iZy004taAAxZrUU3By2QqsjqVfvQnPHw0fmL1OKyzYoqeHGRSsRGGaUsFX6cmB
 rONS2iD9SY1nfTTc4ys4HcnlQoI8ewaK/BqAytNZPMgofAUfNucm62gg8Ir9Zi3Rhy/c
 zp5YkwxIXYwlxS/FlWRfyJBbfUOqO364+gBDTxu1SvJ6d6G2wn1s/h4fCHFjPrA/r29s Ng== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kbu8drkab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Oct 2022 12:31:18 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29LCK0uY006877;
	Fri, 21 Oct 2022 12:31:18 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kbu8drk9y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Oct 2022 12:31:17 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29LCLXA4024084;
	Fri, 21 Oct 2022 12:31:17 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
	by ppma03dal.us.ibm.com with ESMTP id 3kapd5hrfs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Oct 2022 12:31:17 +0000
Received: from b03ledav004.gho.boulder.ibm.com (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
	by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29LCVEkW23593520
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Oct 2022 12:31:14 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1A3EC7805E;
	Fri, 21 Oct 2022 13:11:58 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C4AE17805C;
	Fri, 21 Oct 2022 13:11:56 +0000 (GMT)
Received: from [IPv6:2601:5c4:4300:c551:a71:90ff:fec2:f05b] (unknown [9.211.85.162])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
	Fri, 21 Oct 2022 13:11:56 +0000 (GMT)
Message-ID: <0b8ffaa483e0f79f241b415202a16645addff920.camel@linux.ibm.com>
Subject: Re: SVSM vTPM specification
From: James Bottomley <jejb@linux.ibm.com>
Reply-To: jejb@linux.ibm.com
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
        Tom Lendacky
	 <thomas.lendacky@amd.com>,
        Stuart Yoder <stuart.yoder@arm.com>,
        "Dr. David
	Alan Gilbert" <dgilbert@redhat.com>
Cc: "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>,
        "linux-coco@lists.linux.dev"
	 <linux-coco@lists.linux.dev>,
        Andrew Cooper <andrew.cooper3@citrix.com>
Date: Fri, 21 Oct 2022 08:31:13 -0400
In-Reply-To: <94f85fe8-4001-108d-1962-e2cd75ee0c36@apertussolutions.com>
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
	 <94f85fe8-4001-108d-1962-e2cd75ee0c36@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: K7vMJnx9YgdFfngXsg0LEeicYfKF6WAQ
X-Proofpoint-ORIG-GUID: jhdug6AgI4XDMyOMD7B_LEuGVUo-GvCI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-21_04,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=828 adultscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 mlxscore=0 clxscore=1015 bulkscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2210210071

On Fri, 2022-10-21 at 07:54 -0400, Daniel P. Smith wrote:
> 
> On 10/16/22 12:44, James Bottomley wrote:
> > On Sun, 2022-10-16 at 12:29 -0400, Daniel P. Smith wrote:
> > > If enlightened guest/driver is acceptable, then why not adopt the
> > > pv-vTPM protocol, Xen's vTPM driver, for which there is already a
> > > driver present in the kernel, was designed for deep attestation,
> > > and does not inhibit/block features such as locality?
> > 
> > Erm, because it requires the Xen bus for discovery and
> > communication ... the KVM people might not be so keen on adding
> > that.  The other problem, even if we were to write a virtio
> > equivalent (which KVM doesn't have today because it relies on TIS
> > or CRB emulations), is that for all these virtual drivers, the back
> > endpoint is in the host and we want to terminate it in the SVSM,
> > which is the guest.
> 
> This is why I stated protocol and not transport. The Xen paravirt
> vTPM protocol is designed to go over a shared memory buffer using a
> doorbell notification, ie the transport mechanism under
> consideration. In addition the protocol defined a series of non-
> standard TPM command ordinals to interact with vTPM, more to deal
> with deep attestation. This approach could be leverage to access
> localities instead of trying to mimic a capability designed more for
> register access using a doorbell  which introduces the possibility of
> synchronicity issues. This work could then serve as a basis for a
> "Enlightened" vTPM TCG specification to enable cross-implementation
> compatibility.

The question under consideration was whether we could get an efficient
virtual TPM implementation for free (as in attach to an existing
driver).  The blocker to this for xen-tpmfront is the xenbus discovery.
If we're writing a new driver, we might as well do one that simply
attaches to the SVSM single call interface.  Since the CPU thread
passes into the VTPM and then returns with the result.  There's also no
current need to define non-standard ordinals, but if a need arises
nothing prevents layering them after the fact since they go down this
call interface.  This same is true of localities.  Since the locality
has to be deduced by the vTPM depending on environmental and physical
input nothing prevents them from being layered in later (when someone
figures out how to do localities in VMs).

> > To be clear, the current KVM drivers do emulate localites, it's
> > just that they're unused by the OS and Firmware.  If you look at
> > the TPM emulators themselves, they have the concept of locality,
> > but when they need it, they indirect via an additional platform
> > call (in the ms-tpm, which the current IBM prototype uses, it's a
> > stubbed call to __plat__LocalityGet/Set) ... the locality isn't
> > provided as part of the main TPM command processor, which is why we
> > don't need to worry about it in the initial prototype.  That means
> > if anyone ever does figure out how to do dynamic launch for virtual
> > machines, and requires localities, we can simply add handlers for
> > the stub routines.
> 
> Just as a last little 2₵, I would just highlight that the Mobile CRB 
> committee likely never considered that mobile processors like Arm
> would add a dynamic launch capability that would require the usage
> of localities. Yet today Arm now has a DRTM specification which is
> trying to deal with the fact that the Mobile CRB specification has no
> locality support. Sometimes making adjustments with forethought over
> expediency will save a lot of pain, like having to come up with
> migrations plans with minimal disruptions to customers because
> wholesale replacement of a solution becomes necessary for something
> that was known/raised at the  beginning.

The point of doing a CRB interface (if we do one) is to allow
attachment to an existing driver without too much trap overhead.  The
CRB interface is the one that fits this bill in the current linux
driver form regardless of what the design committee were or weren't
thinking.

You've studiously avoided sketching out what a dynamic launch might
look like for a confidential VM, but I'd have to guess it would be
facilitated and measured by the SVSM itself, being the trusted element.
Following this logic, anything written to the PCRs by the SVSM itself
would occur at a different locality from anything written through the
SVSM call interface ... the net result being only the SVSM could
control the privileged locality for the DRTM.  This would all work
regardless of the vagaries of the emulation presented beyond the SVSM.

James


