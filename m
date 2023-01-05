Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35AA63CE
	for <linux-coco@lists.linux.dev>; Thu,  5 Jan 2023 12:28:29 +0000 (UTC)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 305CH2cM022213
	for <linux-coco@lists.linux.dev>; Thu, 5 Jan 2023 12:28:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=7tTbMG1vlTZr4JcIYovEjAr7Agzu8U4IRwGwDh5BxAk=;
 b=Ij4W63a+3xV8kB46xO4bwJ5K8I8cONli6IKN99YoQrcLHqeGdVb1yU2ah0a5+FVZsT/5
 sJsQ/ZROoIy3BU7RzUJ3aqHRf7PJtbQivLMy9/6nFmhIneWhC3BszLqQFyRBKG+KRfs8
 c9FD+eNt8v8HPJl34JNibx4AAU0+/YdDwALso/OwsqNxivgZeFnVcB46nUNIoOWRHjvf
 O+ms8lEZL91NF5RXnpL/FvLtqo4gbpEfeOUJg5ke26xzLYuIKoPALbfICsDL4p22F1Fz
 kMPIbRJ61oKD6EjNAGza6H35i02TvjOzIJ0cTDy6PPRCGEMp0gvG9Kwu8Waz08t/w5DQ OQ== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mwxdx06nt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-coco@lists.linux.dev>; Thu, 05 Jan 2023 12:28:28 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 305C0A7c007032
	for <linux-coco@lists.linux.dev>; Thu, 5 Jan 2023 12:28:27 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([9.208.130.98])
	by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3mtcq8n2v0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-coco@lists.linux.dev>; Thu, 05 Jan 2023 12:28:27 +0000
Received: from b03ledav004.gho.boulder.ibm.com ([9.17.130.235])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 305CSQ5d10682932
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 5 Jan 2023 12:28:26 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1C8397805E;
	Thu,  5 Jan 2023 14:02:01 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8E0487805C;
	Thu,  5 Jan 2023 14:02:00 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.211.64.53])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
	Thu,  5 Jan 2023 14:02:00 +0000 (GMT)
Message-ID: <6d61034c9e2f0a7e9f30dfd56005a47fd10676cd.camel@linux.ibm.com>
Subject: Re: [RFC 1/3] tpm: add generic platform device
From: James Bottomley <jejb@linux.ibm.com>
Reply-To: jejb@linux.ibm.com
To: Dov Murik <dovmurik@linux.ibm.com>, linux-coco@lists.linux.dev
Date: Thu, 05 Jan 2023 07:28:23 -0500
In-Reply-To: <f7d0bd07-ba1b-894e-5e39-15fb1817bc8b@linux.ibm.com>
References: <acb06bc7f329dfee21afa1b2ff080fe29b799021.camel@linux.ibm.com>
	 <826af61ac2097a14eee0d81cb869eba9c4fdef8b.camel@linux.ibm.com>
	 <f7d0bd07-ba1b-894e-5e39-15fb1817bc8b@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: W803YFpfjJB_a_xyLdjXt2GY5ivzFqOC
X-Proofpoint-GUID: W803YFpfjJB_a_xyLdjXt2GY5ivzFqOC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-05_04,2023-01-04_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 bulkscore=0 mlxscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=660 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301050095

On Thu, 2023-01-05 at 10:08 +0200, Dov Murik wrote:
[...]
> > +static int tpm_platform_send(struct tpm_chip *chip, u8 *buf,
> > size_t
> > len)
> > +{
> > +       int ret;
> > +       struct tpm_send_cmd_req *req = (struct tpm_send_cmd_req
> > *)buffer;
> > +
> > +       if (len > TPM_PLATFORM_MAX_BUFFER - sizeof(*req))
> > +               return -EINVAL;
> > +       req->cmd = TPM_SEND_COMMAND;
> > +       req->locality = locality;
> > +       req->inbuf_size = len;
> 
> In include/linux/tpm_platform.h (below) the comment says:
> 
> + * Note that @inbuf_size must be large enough to hold the response
> so
> + * represents the maximum buffer size, not the size of the specific
> + * TPM command.
> 
> but here we don't set req->inbuf_size to the maximum size (which is
> TPM_PLATFORM_MAX_BUFFER - sizeof(*req) ). Is that OK?

I'll fix the comment.  Unfortunately the ms TPM has a check in the
ExecuteCommand() routine that checks the command and request size are
equal.  I had originally thought to use this field to communicate max
size, but it's not really any problem to make it a define.



> 
> 
> > +       memcpy(req->inbuf, buf, len);
> > +
> > +       ret = pops->sendrcv(buffer);
> > +       if (ret)
> > +               return ret;
> > +
> > +       return 0;
> > +}
> > +
> > +static int tpm_platform_recv(struct tpm_chip *chip, u8 *buf,
> > size_t
> > len)
> > +{
> > +       struct tpm_resp *resp = (struct tpm_resp *)buffer;
> > +
> > +       if (resp->size < 0)
> > +               return resp->size;
> > +
> > +       if (len < resp->size)
> > +               return -E2BIG;
> 
> 
> I suggest another check before the memcpy:
> 
> if (resp->size > TPM_PLATFORM_MAX_BUFFER - sizeof(*resp))
>         return -EINVAL;  // Invalid response from the platform TPM

Yes, I already added that because of your matrix comments.

> 
> 
> > +
> > +       memcpy(buf, buffer + sizeof(*resp), resp->size);
> > +
> > +       return resp->size;
> 
> Is there a possibility of a double recv?
> Should we set resp->size = 0 (or -1) before returning? (while still
> returning the original value)

Not according to the way ->recv() is used, but even if there were, it
should return the previous command until there is a new one.

[...]
> > +/**
> > + * struct tpm_platform_ops - the share platform operations
> > + *
> > + * @sendrecv:  Send a TPM command using the MSSIM protocol.
> > + *
> > + * The MSSIM protocol is designed for a network, so the buffers
> > are
> > + * self describing.  The minimum buffer size is sizeof(u32). 
> > Every
> > + * MSSIM command defines its own transport buffer and the command
> > is
> > + * sent in the first u32 array.  The only modification we make is
> > that
> > + * the MSSIM uses network order and we use the endianness of the
> > + * architecture.  The response to every command (in the same
> > buffer)
> > + * is a u32 size preceded array.  Most of the MSSIM commands
> > simply
> > + * return zero here because they have no defined response.
> > + *
> > + * The only command with a defined request/response size is
> > TPM_SEND_COMMAND
> > + * The definition is in the structures below
> > + */
> > +struct tpm_platform_ops {
> > +       int (*sendrcv)(u8 *buffer);
> 
> nit: In the commit message and struct description you
> use "sendrecv" but the member here is called "sendrcv".

OK, I'll; make the comments consistent (kernel docbook would complain
to the people who bother to run it).

James

