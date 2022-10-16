Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACD97F
	for <linux-coco@lists.linux.dev>; Sun, 16 Oct 2022 16:44:58 +0000 (UTC)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29GE0FrC026863;
	Sun, 16 Oct 2022 16:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=BeTAlPGQlXQ87p1mAZP7XYfIzIgJqj6GOuAxqquQ9Fk=;
 b=KByWN4omoY68rzNiYoexe9iJfnGsYgxWySCkQUEbHkVqDXd0i8Bp/0pz32C2jzOYoSFi
 nUNvSsmegxmEUZAOrCSNP8cr1COMr+u3idy2QjCte1AqZONDztvoNj0bfBdd3uFssNIf
 5HAhde8XsqtEG0FxPubTlvriTzNQvXYP3hUu0KpbDO35yqJuMyjJffZDLva2uQuvMo5B
 a8kGo8gkSCV38fjbCgE0PQMZLxIJOs6vBJZtI4aQz1XmswJ2N9d0c88sLsAniEUxq3Sq
 M6dNm46EBqwFyG2MTywP1uhTvg+ku/dRbiT2x/kTHkp5ZBLbqcaXgLoqSBOLbsH1ll0N gA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k865v8cpr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 16 Oct 2022 16:44:40 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29GGVWeS013741;
	Sun, 16 Oct 2022 16:44:39 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k865v8cph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 16 Oct 2022 16:44:39 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29GGbTcQ011347;
	Sun, 16 Oct 2022 16:44:38 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
	by ppma04dal.us.ibm.com with ESMTP id 3k7mgaf3j0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 16 Oct 2022 16:44:38 +0000
Received: from b03ledav004.gho.boulder.ibm.com (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
	by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29GGicHs13697754
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 16 Oct 2022 16:44:38 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 00CFF7805E;
	Sun, 16 Oct 2022 17:21:59 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A8BFF7805C;
	Sun, 16 Oct 2022 17:21:57 +0000 (GMT)
Received: from [IPv6:2601:5c4:4300:c551:a71:90ff:fec2:f05b] (unknown [9.211.85.162])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
	Sun, 16 Oct 2022 17:21:57 +0000 (GMT)
Message-ID: <fb7d5aa64187daff6e61cdcfe7084a5eef7e0153.camel@linux.ibm.com>
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
Date: Sun, 16 Oct 2022 12:44:34 -0400
In-Reply-To: <485fd3eb-5547-6688-cb6f-007c0c08af2c@apertussolutions.com>
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
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: iXmzyvPLqv_S-6umkqeD-9I91fOWoSsQ
X-Proofpoint-ORIG-GUID: U5oIBg4JzAKnIbYtrCQAuA1VJ8G_JNru
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-16_11,2022-10-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=611
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 mlxscore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210160101

On Sun, 2022-10-16 at 12:29 -0400, Daniel P. Smith wrote:
> If enlightened guest/driver is acceptable, then why not adopt the 
> pv-vTPM protocol, Xen's vTPM driver, for which there is already a
> driver present in the kernel, was designed for deep attestation, and
> does not inhibit/block features such as locality?

Erm, because it requires the Xen bus for discovery and communication
... the KVM people might not be so keen on adding that.  The other
problem, even if we were to write a virtio equivalent (which KVM
doesn't have today because it relies on TIS or CRB emulations), is that
for all these virtual drivers, the back endpoint is in the host and we
want to terminate it in the SVSM, which is the guest.

To be clear, the current KVM drivers do emulate localites, it's just
that they're unused by the OS and Firmware.  If you look at the TPM
emulators themselves, they have the concept of locality, but when they
need it, they indirect via an additional platform call (in the ms-tpm,
which the current IBM prototype uses, it's a stubbed call to
__plat__LocalityGet/Set) ... the locality isn't provided as part of the
main TPM command processor, which is why we don't need to worry about
it in the initial prototype.  That means if anyone ever does figure out
how to do dynamic launch for virtual machines, and requires localities,
we can simply add handlers for the stub routines.

James


